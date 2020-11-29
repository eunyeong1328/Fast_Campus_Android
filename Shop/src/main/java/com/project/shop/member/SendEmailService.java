package com.project.shop.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.shop.member.impl.MemberDAO;

import lombok.AllArgsConstructor;

@Service("mailService")
@AllArgsConstructor
public class SendEmailService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private JavaMailSender mailSender;

	private static final String FROM_ADDRESS = "leeyoung778811@gmail.com";
	// 위에 본인의 이메일 주소 입력!! 이렇게 설정 안 해주면 디폴트 값이 mail-context.xml에 작성한 username이 들어감

	public MailDto createMailAndChangePassword(String member_id, String email) {
		String str = getTempPassword();
		MailDto dto = new MailDto();
		dto.setAddress(email);
		dto.setTitle("[쩝쩝박사] 임시 비밀번호 안내 이메일 입니다.");
		dto.setMessage(
				"안녕하세요. [쩝쩝박사] 임시 비밀번호 안내 관련 이메일입니다.\n" + "아이디가 [" + member_id + "]" + "인 임시 비밀번호는 " + str + "입니다.");
		updatePassword(str, member_id);
		return dto;
	}

	public void mailSend(MailDto mailDto) {
		System.out.println("이메일 전송 완료!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailDto.getAddress()); // 받는사람 주소
		message.setFrom(SendEmailService.FROM_ADDRESS); // 보내는 사람 주소
		message.setSubject(mailDto.getTitle()); // 메일제목
		message.setText(mailDto.getMessage()); // 메일 내용

		mailSender.send(message);
	}

	// 비밀번호 수정
//	public void updatePassword(String str, String userEmail) {
//		String pw = str;
//		String id = memberDAO.findEmailInfo(userEmail).getMember_id();
//		memberDAO.updateUserPassword(id, pw);
//	}
	
	// 비밀번호 수정
	 public void updatePassword(String str,String id){
		 	System.out.println("이 비밀번호 수정 메세지가 확인이 안 되는 건가요??ㅠㅠ");
	        String password = str;
	        String member_id = memberDAO.findEmailInfo(id).getMember_id();
	        HashMap<String,String> map = new HashMap<String, String>();
	        map.put("password",password);
	        map.put("member_id",member_id);	   
	        System.out.println("여기까진 값이 잘 넘어감 밑에 있는 값이 잘 넘어가지 않는다");
	        System.out.println("비밀번호 가 왜 mapper에 안 들어가는 거냐고!!=====패스워드====== "+ map.get("password"));
			System.out.println("비밀번호가 왜 mapper에  안 들어가는 거냑ㅎ!!=====아이디====== "+ map.get("member_id"));
	        //memberDAO.updateUserPassword(map);
	        System.out.println("이제 수정 후에 값을 보여주기 <<아이디>>: " + map.get(member_id));
	        System.out.println("이제 수정 후에 값을 보여주기 <<비밀번호>>: " + map.get(password));
	 }

	// 10자리의 랜덤난수를 생성하는 메소드
	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}


}
