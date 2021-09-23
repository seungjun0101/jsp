package day3.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day3.dto.Customer;
import util.MYSQLConnectionUtil;

public class CustomerDao {
	private static CustomerDao dao = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return dao;
	}
	
	// 정보 수정
	public void update(Customer cus) {
		String sql ="update customer set email=?,addr=? where idx=?";
	
		Connection conn = MYSQLConnectionUtil.connect();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cus.getEmail());
			pstmt.setString(2, cus.getAddr());
			pstmt.setInt(3, cus.getIdx());
			pstmt.execute();
			conn.commit();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("update 오류 : " + e.getMessage());
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e1) {
			}
			MYSQLConnectionUtil.close(conn);
		}
	}
	// 정보 삭제
		public void delete(int idx) {
			String sql ="delete from customer where idx=?" ;	
			Connection conn = MYSQLConnectionUtil.connect();
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.execute();
				conn.commit();
			}catch(SQLException e) {
				e.printStackTrace();
				System.out.println("delete 오류 : " + e.getMessage());
			}finally {
				try {
					pstmt.close();
				} catch (SQLException e1) {
				}
				MYSQLConnectionUtil.close(conn);
			}
		}
		
	//idx로 정보 조회
	public Customer selectOne(int idx) {
		Customer cus = null;
		String sql = "select * from customer where idx=?";   //idx 는 pk 컬럼
		Connection conn = MYSQLConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cus = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getInt(7), rs.getString(8));
			}
		}catch (SQLException e) {
			System.out.println("selectOne 오류 : " + e.getMessage());
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {	}
			MYSQLConnectionUtil.close(conn);
		}
		
		return cus;   //idx가 없는 값으로 조회하면 리턴은 null
	}

	//전체조회
	public List<Customer> selectAll(){
		Connection conn = MYSQLConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM customer"; // --> 실행예측 : row의 최대갯수는 많음.
		Customer cus;
		List<Customer> list = new ArrayList<Customer>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();// select? 또는 insert? update? delete?
			while (rs.next()) {
				// cus 클래스 객체와 조회 결과 각 컬럼을 매핑
				cus = new Customer(rs.getInt(1),rs.getString("name"), rs.getString(3), rs.getString(4)
						, rs.getString(5), rs.getString(6), rs.getInt(7),rs.getNString(8));
				list.add(cus); // 리스트에 추가합니다.
			}
			return list;
		} catch (SQLException e) {
			System.out.println("customer List 조회에 문제가 있습니다. : " + e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("close 오류 : " + e.getMessage());
			}
			MYSQLConnectionUtil.close(conn);
		}
		return null;
	}
		
	//인서트
	public void insert(Customer cus) {
		String sql = "insert into customer(name,password,email,addr,gender,age,hobby)" + 
				" values (?,?,?,?,?,?,?)";
		Connection conn = MYSQLConnectionUtil.connect();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 기호에 들어갈 값의 바인딩 -> mybais 라이브러를 사용해서 dto 클래스와 자동 맵핑(mapping)
			pstmt.setNString(1, cus.getName());
			pstmt.setNString(2, cus.getPassword());
			pstmt.setNString(3, cus.getEmail());
			pstmt.setNString(4, cus.getAddr());
			pstmt.setNString(5, cus.getGender());
			pstmt.setInt(6, cus.getAge());
			pstmt.setNString(7, cus.getHobby());
			
			pstmt.execute();
			conn.commit();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e1) {
			}
			MYSQLConnectionUtil.close(conn);
		}
		
	}
	
	
}//전체 end