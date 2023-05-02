package cn.esweb.eswebstore.dao;
import cn.esweb.eswebstore.domain.LoginLog;
import cn.esweb.eswebstore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class LoginLogDao {
    //向数据库中写入日志信息
    public void addLoginLog(LoginLog loginLog)
        throws SQLException {
        String sql ="insert into loginlog(userid,ipaddresses,date) values(?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql,
                new Object[] {loginLog.getUserid(), loginLog.getIpaddress(),
                        loginLog.getDate()});

        if (row == 0) {
            throw new RuntimeException();
        }
    }
}
