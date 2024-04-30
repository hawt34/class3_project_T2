package itwillbs.p2c3.boogimovie.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 데이터베이스 작업 준비 및 해제(= 자원 반환) 작업을 공통으로 수행할 
// 공통 메서드를 갖는 JdbcUtil 클래스
// 여러 클래스에 분산되어 있는 동일한 코드를 현재 클래스에 모아놓기(= 모듈화)
public class JdbcUtil {
	// 1. DBCP 에서 Connection 객체를 리턴받아 다시 외부로 리턴하는 getConnection() 메서드 정의
	// => 단, 클래스명만으로 접근하도록 static 메서드로 정의
	public static Connection getConnection() {
		// Connection 객체를 리턴받아 저장할 변수 선언
		Connection con = null;
		
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://itwillbs.com:3306/c3d2401t2";
			String user = "c3d2401t2";
			String password = "1234";
			
			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);
			System.out.println("드라이버 로드 성공!");
			
			// 2단계. DB 연결
			con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공!");
			con.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패!");
			e.printStackTrace();
		}
		
		// DB 연결 작업 성공 후 리턴받은 Connection 객체를 외부로 리턴
		return con;
		
	}
	
	// ===========================================================================================
	// 2. 데이터베이스 자원 반환(close())을 공통으로 수행할 close() 메서드 정의
	//    단, 각각의 객체(Connection, PreparedStatement, ResultSet)를 따로 전달받아
	//    각각의 close() 메서드를 호출하기 위해 이름은 동일하고 파라미터만 다른 메서드 여러개 정의
	//    (= 메서드 오버로딩)
	//    => 파라미터 : Connection 타입(con), PreparedStatement 타입(pstmt), ResultSet 타입(rs)
	//    => 리턴타입 : void
	//    => 인스턴스 생성없이도 메서드 호출이 가능하도록 static 메서드로 정의
	public static void close(Connection con) {
		// 전달받은 Connection 객체 반환
		// => 단, Connection 객체가 null 이 아닐 경우에만 close() 메서드 호출
		try {
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(PreparedStatement pstmt) {
		// 전달받은 PreparedStatement 객체 반환
		try {
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(ResultSet rs) {
		// 전달받은 ResultSet 객체 반환
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// ===================================================================
	// 트랜잭션 처리에 필요한 커밋, 롤백 작업을 수행할 메서드 정의
	// => 단, Connection 객체에 대해 Auto commit 기능 해제가 선행되어야 함
	// => Connection 객체를 파라미터로 전달받아 commit(), rollback() 메서드 호출
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}














