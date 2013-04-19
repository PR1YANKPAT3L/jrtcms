package org.springframework.orm.ibatis;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy;
import org.springframework.util.Assert;

import com.ibatis.sqlmap.client.SqlMapSession;

public class SqlMapClientTemplate1 extends SqlMapClientTemplate  {

	 public Object execute(SqlMapClientCallback action)
     throws DataAccessException
     {
     SqlMapSession session;
     Connection ibatisCon;
     Assert.notNull(action, "Callback object must not be null");
     Assert.notNull(getSqlMapClient(), "No SqlMapClient specified");
     session = getSqlMapClient().openSession();
     if(logger.isDebugEnabled())
         logger.debug("Opened SqlMapSession [" + session + "] for iBATIS operation");
     ibatisCon = null;
     Connection springCon;
     DataSource dataSource;
     boolean transactionAware;
     springCon = null;
     dataSource = getDataSource();
     transactionAware = dataSource instanceof TransactionAwareDataSourceProxy;
     try
     {
         ibatisCon = session.getCurrentConnection();
         if(ibatisCon == null)
         {
             springCon = transactionAware ? dataSource.getConnection() : DataSourceUtils.doGetConnection(dataSource);
             session.setUserConnection(springCon);
             if(logger.isDebugEnabled())
                 logger.debug("Obtained JDBC Connection [" + springCon + "] for iBATIS operation");
         } else
         if(logger.isDebugEnabled())
             logger.debug("Reusing JDBC Connection [" + ibatisCon + "] for iBATIS operation");
     }
     catch(SQLException ex)
     {
         throw new CannotGetJdbcConnectionException("Could not get JDBC Connection", ex);
     }
     try
     {
         Object obj;
         try
         {
             obj = action.doInSqlMapClient(session);
         }
         catch(SQLException ex)
         {
             throw getExceptionTranslator().translate("SqlMapClient operation", null, ex);
         }
         return obj;
     }
     finally
     {
         try
         {
             if(springCon != null)
                 if(transactionAware)
                     springCon.close();
                 else
                     DataSourceUtils.doReleaseConnection(springCon, dataSource);
         }
         catch(Throwable ex)
         {
             logger.debug("Could not close JDBC Connection", ex);
         }
         if(ibatisCon != null) session.close();
     }
     
 }

}
