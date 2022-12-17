## Imuseum

# 포트폴리오 개요
- 기획 및 제작 : IT WILL 2조 (김동환,김소연,백은주,서태우,이현준,임다은)
- 분류 : 팀 프로젝트
- 제작 기간 : 2022.11.16 ~ 2022.12.16 (4주)
- 배포일 : 2022.12.17
- 주요 기능 : 반응형 웹, 소셜 로그인, 전시 조회/예매, 굿즈 구입, 장바구니
- 사용 툴 : Spring 3.9.13 , Tomcat 9, 

#메인 페이지

![image](https://user-images.githubusercontent.com/120763174/208218998-246272d0-5fe3-4184-9c28-2f3e82a8cd4a.png)

▶ 주요 전시 및 최근 등록된 상품 표시



# 로그인 기능

![image](https://user-images.githubusercontent.com/120763174/208219100-005d91ab-9d8a-4717-8418-e6fea8614728.png)

▶ 사이트 로그인 / 소셜 로그인(네이버,카카오,구글) 구현



![image](https://user-images.githubusercontent.com/120763174/208219125-fa39d12d-307c-4bf2-b2db-55517e786380.png)

▶ 일반 회원 가입 시, 모달 창으로 회원 가입 구현 
   소셜 로그인 시 DB에 회원 등록 유무 체크 후 로그인
   
   
   ```java
       //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
    		MemberVO vo)
            throws IOException, ParseException {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;
        jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");	
        
		System.out.println(response_obj);
		//Json 파싱
        String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String birthday = (String) response_obj.get("birthday");
		String birthyear = (String) response_obj.get("birthyear");
		String phone = (String) response_obj.get("mobile");
		String birthDay = birthyear + "-"  + birthday;
		
		vo.setId(id);
		
		Date sqlDate = Date.valueOf(birthDay);
		if(memberService.getMemberById(vo) == null) {
			vo.setEmail(email);
			vo.setName(name);
			vo.setPhone(phone);			
			vo.setGrade("SEED");	
			vo.setAdmin("NORMAL");
			vo.setSnsType(2);
			vo.setBirth(sqlDate);
			memberService.joinMember(vo);
			session.setAttribute("member", vo);
		} else {
			session.setAttribute("member", memberService.getMemberById(vo));
		}
	
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "redirect:login.do";
    }

