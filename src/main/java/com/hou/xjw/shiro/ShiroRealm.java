package com.hou.xjw.shiro;

import com.hou.xjw.model.shiroPermission.Role;
import com.hou.xjw.model.shiroPermission.User;
import com.hou.xjw.service.ResourceService;
import com.hou.xjw.service.RoleService;
import com.hou.xjw.service.UserService;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 自定义的Realm，用于shiro框架的授权和鉴权等
 * */

public class ShiroRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;

    @Resource
    private RoleService roleService;

    @Resource
    private ResourceService resourceService;

    protected static Logger logger = Logger.getLogger(ShiroRealm.class);

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //用户名
        User user = (User) principals.fromRealm(getName()).iterator().next();
        Integer userId = user.getId();
        //根据用户id来添加相应的权限和角色
        if(userId != null){
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            addRole(userId, info);
            addResource(userId, info);
            return info;
        }
        return null;
    }

    /**
     * 认证回调函数，登录信息和用户验证信息验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        // 把token转换成User对象
        User userLogin = tokenToUser((UsernamePasswordToken) authcToken);
        // 验证用户是否可以登录
        Map<String, Object> map = userService.doUserLogin(userLogin);
        User user = (User) map.get("retUser");
        if(user == null)
            return null; // 异常处理，找不到数据
        // 设置session
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("loginUser", user);
        //当前 Realm 的 name
        String realmName = this.getName();
        //登陆的主要信息: 可以是一个实体类的对象, 但该实体类的对象一定是根据 token 的 username 查询得到的.
//        Object principal = ui.getUsername();
//        Object principal = authcToken.getPrincipal();
        logger.info("User : " + user.getUserName() + "is loginning.");
        return new SimpleAuthenticationInfo(
                new User(user.getId(), user.getUserName()), user.getPassword(), realmName);
    }

    private User tokenToUser(UsernamePasswordToken authcToken) {
        User user = new User();
        user.setUserName(authcToken.getUsername());
        user.setPassword(String.valueOf(authcToken.getPassword()));
        return user;
    }

    /**
     * 添加角色
     */
    private void addRole(Integer userId, SimpleAuthorizationInfo info) {
        List<Role> roles = roleService.getRoleByUserId(userId);
        if(roles!=null&&roles.size()>0){
            for (Role role : roles) {
                info.addRole(role.getRoleName());
                logger.info(userId + " get roleName : " + role.getRoleName());
            }
        }
    }

    /**
     * 添加资源
     */
    private void addResource(Integer userId,SimpleAuthorizationInfo info) {
        List<Role> roles = roleService.getRoleByUserId(userId);
        if(roles!=null&&roles.size()>0){
            for (Role role : roles) {
                //info.addRole(role.getRoleName());
                List<com.hou.xjw.model.shiroPermission.Resource> list =
                        resourceService.getResourceByRoleId(role.getId());
                for (com.hou.xjw.model.shiroPermission.Resource resource: list) {
                    info.addStringPermission(resource.getUrl());//添加权限
                    logger.info(role.getRoleName() + " get resourceUrl : " + resource.getUrl());
                }
            }
        }
    }

    //一定要写getset方法
    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
