package cn.esweb.eswebstore.web.filter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // 处理请求乱码
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletRequest myRequest = new MyRequest(httpServletRequest);
        // 处理响应乱码
        response.setContentType("text/html;charset=utf-8");
        chain.doFilter(myRequest, response);
    }
    public void destroy() {

    }
}

class MyRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request;
    private boolean hasEncode;
    //构造
    public MyRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }
    @Override
    public Map getParameterMap() {
        //获取请求方式
        String method = request.getMethod();
        if (method.equalsIgnoreCase("post")) {
            //post请求处理
            try {
                //post乱码
                request.setCharacterEncoding("utf-8");
                return request.getParameterMap();
            } catch (UnsupportedEncodingException e) {
                //异常处理
                e.printStackTrace();
            }
        } else if (method.equalsIgnoreCase("get")) {
            //get请求处理
            Map<String, String[]> parameterMap = request.getParameterMap();
            if(!hasEncode) {
                //get手动编码只运行一次
                for (String parameterName : parameterMap.keySet()) {
                    String[] values = parameterMap.get(parameterName);
                    if(values != null) {
                        for (int i = 0; i < values.length; i++) {
                            //转码
                            values[i] = new String(values[i].getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                        }
                    }
                }
                hasEncode = true;
            }
            return parameterMap;
        }
        return super.getParameterMap();
    }
    @Override
    public String getParameter(String name) {
        Map<String, String[]> parameterMap = getParameterMap();
        String[] values = parameterMap.get(name);
        if (values == null) {
            //空白字符处理
            return null;
        }
        return values[0];
    }
    @Override
    public String[] getParameterValues(String name) {
        Map<String, String[]> parameterMap = getParameterMap();
        String[] values = parameterMap.get(name);
        return values;
    }
}