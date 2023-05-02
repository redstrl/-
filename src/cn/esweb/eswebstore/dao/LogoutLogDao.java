package cn.esweb.eswebstore.dao;
import cn.esweb.eswebstore.domain.LogoutLog;
import cn.esweb.eswebstore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class LogoutLogDao {
    //向数据库中写入日志信息
    public void addLogoutDao(LogoutLog logoutlog)
            throws SQLException {
        String sql ="insert into logoutlog(userid,ipaddresses,date) values(?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        int row = runner.update(sql,
                new Object[] {logoutlog.getUserid(), logoutlog.getIpaddress(),
                        logoutlog.getDate()});

        if (row == 0) {
            throw new RuntimeException();
        }
    }
}
