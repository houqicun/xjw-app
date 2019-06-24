package com.hou.xjw.util;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AjaxPrint  {

    /**
     * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
     */
    public static void renderData (HttpServletResponse response, String data) {
        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
            printWriter.print(data);
        } catch (IOException ex) {
            Logger.getLogger(AjaxPrint.class.getName()).log(Level.ERROR, null, ex);
        } finally {
            if (null != printWriter) {
                printWriter.flush();
                printWriter.close();
            }
        }
    }

}
