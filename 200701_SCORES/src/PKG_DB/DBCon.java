package PKG_DB;
import java.sql.*;

public class DBCon {
	// field
	private String url;
	private String userID;
	private String userPW;
			
	// constructor : 클래스를 만들고 인스턴스화 하면 자동으로 실행되는 메서드, 클래스와 이름이 같음
	// 오버로딩(매서드의 매개변수가 다르거나, 데이터타입이 다르거나..)
	public DBCon() {};
	public DBCon(String url, String userID, String userPW) {
		this.url    = url;
		this.userID = userID;
		this.userPW = userPW;
	}
	
	// getter setter
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPW() {
		return userPW;
	}
	
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	};
	
	
	// method
		// connection
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(this.url, this.userID, this.userPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	};
		
		//select
	public PreparedStatement getPreparedStatement(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	};
	
	public ResultSet getResultSet(String sql) {
		ResultSet rs = null;
		Connection con = this.getConnection();
		PreparedStatement pstmt = getPreparedStatement(con, sql);
		
		try {
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	};

		//insert, Update, Delete
	public void setCUD(String sql) {
		Connection con = this.getConnection();
		PreparedStatement pstmt = getPreparedStatement(con, sql);
		try {
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	};
	
		// Use procedure
	public CallableStatement getCallableStatement(String strProcName) {
		Connection con = getConnection();
		CallableStatement cstmt = null;
		try {
			cstmt = con.prepareCall(strProcName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cstmt;
	}
	
	 public ResultSet getResultSet(String strProcName, String[] strInParams, int[] sqlTypes, String[] strInOut) {
	     ResultSet rs   = null;
	     try {
	       CallableStatement cstmt = this.getCallableStatement(strProcName);
	         
         for (int i = 0; i < strInParams.length; i++) {
            if(strInOut[i] == "IN") {
               cstmt.setString((i+1), strInParams[i]);
            } else {
               cstmt.registerOutParameter((i+1), sqlTypes[i]);
               cstmt.execute();
               rs = (ResultSet)cstmt.getObject(i+1);
            }
         }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	   return rs;
	}

	 // 저장 수정 추가 삭제 프로시저 사용
	 public int setUpdate(String strProcName, String[] strInParams) {
		 int updateCnt = 0;
		 
		 CallableStatement cstmt = this.getCallableStatement(strProcName);
		 
		 for (int i = 0; i < strInParams.length; i++) {
			try {
				cstmt.setString(i+1, strInParams[i]);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
		try {
			cstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return updateCnt;
	 }
}
