package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

//JDBC를 이용한 DB연결을 위해 클래스 상속
public class BoardDAO extends JDBConnect{
	//인수 생성자에서는 application  내장객체를 매개변수로 전달한다.
	public BoardDAO(ServletContext application) {
		// 부모 생성자에서는 application을 통해 web.xml에 직접 접근하여 
		// 컨텍스트 초기화 파라미터를 얻어온다.
		super(application);
	}
	//멤버메서드
	//게시무의 갯수를 카운트하여 int형으로 반환한다.ㅏ
	public int  selectCount(Map<String, Object> map) {
		//결과(게시물 수)를 담을 변수
		int totalCount = 0;
		
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "select count(*) from board ";
		//검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만 인출한다.
		if(map.get("searchWord") != null) {
			query += " where "+map.get("searchField")+" "
					+"LIKE'%"+map.get("searchWord")+"%'";
		}
		
		try {
			//정적 쿼리문 실행을 위한 Statement 객체 생성
			stmt = con.createStatement();
			//쿼리 실행후 result객체에 반환
			rs = stmt.executeQuery(query);
			//커서 내리고
			rs.next();
			//카운트 인출 (컬럼이 하나뿐임)
			totalCount = rs.getInt(1);
			
			
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//작성된 게시물 반환.
	//반환값은 여러개의 레코드를 반환 할수 있으므로 List컬렉션을 반환타입으로 정의
	public List<BoardDTO> selectList(Map<String, Object> map){
		/*
		 	List 계열의  컬렉션 생성.
		 	이때 타입 매개변수는 BoardDTO 객체로 설정.
		 	게시판 목록은 출력순서(num,title,content,id,postdate,visitcount)
		 	가 보장되야 하므로 SET컬렉션은 사용불가.
		 	List를 사용해야 한다. 
		 */
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from board";
		if(map.get("searchWord")!= null) {
			query += " where " + map.get("searchField")+" " 
					//앞뒤 검색을 위한 like문
					+"like '%"+map.get("searchWord")+"%'";
		}
		
		//최근게시물 상단을 위한 내림차순 정렬
		query += " order by num desc";
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while (rs.next()){
				//값을 가져와서 DTO에 저장
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount (rs.getString("visitcount"));
				
				//list객체에 dto 저장
				bbs.add(dto);
			}
			System.out.println(bbs.toString());
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
		
	}
	//새로운 게시물 입력을 위한 메서드
	public int insertWrite(BoardDTO dto) {
		int result=0;
		
		try {
			/*
			 	인파리터가 있는 동적 쿼리문으로 insert문 작성 게시물의 일련번호는
			 	시퀀스를 통해 자동 부여받고, 조회수의 경우에는 0을 입력한다.
			 */
			String query = "insert into board(num,title,content,id,visitcount) "
							+ "values(seq_board_num.nextval,?,?,?,0)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//인수로 전달된 게시물의 일련번호로 하나의 게시물을 인출한다.
	public BoardDTO selectView(String num) {
		//하나의 레코드 저장을 위한 DTO객체 생성
		BoardDTO dto = new BoardDTO();
		
		//inner join(내부조인)을 통해 member테이블의 name컬럼까지 가져온다.
		String sql = "select b.*, M.name from member M inner join board B on M.id=B.id where num=?";
		
		try {
			//인파라미터 설정 및 쿼리문 실행
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			/*
			 	일련변호는 중복되지 않으므로 단 한개의 게시물만 인출하게 된다.
			 	따라서 while문이 아닌 if문으로 처리한다.
			 	next() 메서드는 ResultSet으로 반환된 게시물을 확인해서 존재하면 
			 	true를 반환해 준다.
			 */
			if(rs.next()) {
				//DTO 객체에 레코드를 저장한다.
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				/*
				 * 각 컬럼의 값을 추출할때 1부터 시작하는 인덱스와 컬럼명 둘다 사용할 수 있다.
				 * 날짜인 경우는 getDate() 메소드로 추출할 수 있다.
				 */
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	//게시물의 조회수를 1증가시킨다.
	public void updateVisitCount(String num) {
		/*
		 	게시물의 일련번호를 통해 visitcount를 1증가시킨다.
		 	해당컬럼은 number 타입이므로 사칙연산이 가능하다.
		 */
		String query = "update board set visitcount=visitcount+1 where num=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}
	
	//수정된 게시물을 업데이트함
	public int updateEdit(BoardDTO dto) {
		int result =0;
		
		try {
			String query = "update board set title=?, content=? where num=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getNum());
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
		}
		return result;
	}
	
	//게시물 삭제 메소드
	public int deletePost(BoardDTO dto) {
		int result =0;
		
		try {
			sql = "delete from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시물 목록 출력시 페이징 기능 추가
	public List<BoardDTO> selectListpage(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		/*
		 	검색조건에 일치하는 게시물을 얻어온 후 각 페이지에 출력할 구간까지
		 	설정할 서브 쿼리문 작성
		 */
		sql = "select * from ( select Tb.*, rownum rNum from (select * from board";
		//검색어가 있는 경우에는 where을 추가한다.
		if(map.get("searchWord")!=null) {
			sql+= " where " + map.get("searchField")+ " like '%"+map.get("searchWord")+"%' "; 
		}
		//between을 통해 게시물의 구간을 결정할 수 있다.
		sql +=" order by num desc) Tb) where rNum between ? and ?";
		/*
		  	between 절 대신 비교연산자를 통해 쿼리문을 구성할 수도 있다.
		  	=>	where rNum >= ? and rNum<=?
		 */ 
		try {
			// 인파라미터가 있 쿼리문이므로 prepared 객체를 생성한다.
			pstmt = con.prepareStatement(sql);
			// 인파라미터를 설정한다. 구간의 시작과 끝을 계산한 값이다.
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			//쿼리문을 실행하고 결과레코드를 ResultSet으로 반환받는다.
			rs = pstmt.executeQuery();
			// 결과 레코드의 갯수만큼 반복하여 List컬렉션에 저장한다.
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
//		System.out.println(sql);
		return bbs;
	}
}
