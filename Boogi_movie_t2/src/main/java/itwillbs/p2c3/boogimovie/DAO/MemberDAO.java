package itwillbs.p2c3.boogimovie.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import itwillbs.p2c3.boogimovie.VO.memberVO;


public class MemberDAO {
	// ----------------- 싱글톤 디자인 패턴을 활용한 MemberDAO 인스턴스 관리 작업 --------------
	// 1. 외부에서 인스턴스 생성이 불가능하도록 생성자를 private 접근제한자로 선언
	private MemberDAO() {} // 외부에서 생성자 호출이 불가능하므로 인스턴스 생성도 불가
	
	// 2. 자신의 클래스 내에서 직접 인스턴스 생성 후 멤버변수(instance)에 저장
	//    => 멤버변수는 외부에서 접근이 불가능하도록 private 접근제한자로 선언
	//    => 인스턴스 생성 없이도 클래스가 메모리에 로딩될 때 함께 로딩되어
	//       로딩 시점에 인스턴스가 생성되고, 외부에서 클래스명만으로 접근 가능하도록
	//       static 멤버변수로 선언
	private static MemberDAO instance = new MemberDAO();

	// 3. 생성된 인스턴스를 외부로 리턴하는 Getter 메서드 정의
	//    => 누구나 접근 가능하도록 public 접근제한자로 선언
	//    => 인스턴스 생성 없이 클래스가 메모리에 로딩될 때 함께 로딩되어
	//       외부에서 클래스명만으로 호출 가능하도록 static 메서드로 선언
	public static MemberDAO getInstance() {
		return instance;
		// => 주의! static 메서드 내에서 접근하는 변수도 반드시 static 변수로 선언되어야 한다! 
	}
	// ========================================================================
	// DB 접근에 사용할 Connection 객체를 저장할 Connection 타입 멤버변수(con) 선언
	private Connection con;
	
	// DB 접근에 사용할 Connection 객체를 Service 로부터 전달받기 위한 setConnection() 메서드 정의
	// => 파라미터 : Connection 객체   리턴타입 : void
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	public boolean IsRegisteredMember(memberVO member) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		boolean IsRegisteredMember = false; 
		
		try {
			String sql = "SELECT * FROM member WHERE member_name = ? AND member_birth = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getBirth());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				IsRegisteredMember = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return IsRegisteredMember;
	}
}
