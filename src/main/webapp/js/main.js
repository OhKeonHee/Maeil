    //클릭했을 때 다크모드로 변경
document.addEventListener('DOMContentLoaded', function () { // 브라우저가 html을 먼저 읽고 DOM트리 완성 즉시 발생
	var modeSwitch = document.querySelector('.mode-switch'); // mode-switch 클래스 선택
	
	modeSwitch.addEventListener('click', function () { // modeSwitch 클래스에 클릭 리스너 등록
		document.documentElement.classList.toggle('dark'); // <html>=document.documentElement
		modeSwitch.classList.toggle('active'); // dark: dark로 토글, active: active로 토글
	});
});
    //querySelector = "" 를 제공한 선택지와 일치하면 제공
    //querySelectorAll = 선택자를 만족하는 모든요소의 목록이 필요할 경우
var sendForm = document.querySelector('#chatform'), // id가 chatform(전송버튼) 선택
	textInput = document.querySelector('.chatbox'), // chatbox(textarea) 클래스 선택
	chatList = document.querySelector('.chatlist'), // chatlist 클래스 선택
	userBubble = document.querySelectorAll('.userInput'), // userInput 클래스 배열 선택
	// botBubble = document.querySelectorAll('.bot__output'), // bot__output 클래스 배열 선택
	animateBotBubble = document.querySelectorAll('.bot__input--animation'), // bot__input--animation 클래스 배열 선택
	overview = document.querySelector('.chatbot__overview'), // chatbot__overview 클래스 선택
	hasCorrectInput, 
	imgLoader = false, // hasCorrectInput, imgLoder false로 설정
	animationCounter = 1, // animationCounter 1로 설정
	animationBubbleDelay = 600, // animationBubbleDelay 600으로 설정
	input,
	previousInput, 
	isReaction = false, // input, previousInput, isreaction false로 설정
	defaultCommReaction = "defaultCommReaction 기본값 설정", // defaultCommReaction "해당문자"로 설정
	chatbotButton = document.querySelector(".submit-button") // submit-button 클래스 선택


        //값을 전송할 때 소문자로 변경(toLowerCase)
        //keycode 13 = JQuery에서 Input 박스에 Enter시 처리를 위한 코드
        //preventDefault = submit하면 창이 새로고침하는데 이를 막아줌 (우린 submit버튼으로 채팅을 전송하기 때문에)

sendForm.onkeydown = function(e){ // chatform(전송버튼)에 키를 눌렀을 때 발생하는 이벤트 등록
	if(e.keyCode == 13){ // 엔터키가 눌리면
		e.preventDefault();// 화면이 새로고침되지 않도록 함
		
		var input = textInput.value.toLowerCase(); // chatbox(텍스트에리어)에 입력한 값 input에 넣기

		if(input.length > 0) { // 입력이 있다면 (입력한 값의 길이가 0보다 크면)
		createBubble(input) // createBubble 함수 실행(파라미터에 입력값 input)
		}
	}
};

sendForm.addEventListener('submit', function(e) { // chatform(전송버튼)에 전송 이벤트 등록
	e.preventDefault(); // 화면이 새로고침되지 않도록 함

	var input = textInput.value.toLowerCase(); // chatbox(텍스트에리어)에 입력한 값 input에 넣기

	if(input.length > 0) { // 입력이 있다면 (입력한 값의 길이가 0보다 크면)
	createBubble(input) // createBubble 함수 실행(파라미터에 입력값 input)
	}
}) 

var createBubble = function(input) { // createBubble 함수 (파라미터로 input을 받음)
	var chatBubble = document.createElement('li'); // chatBubble 변수에 'li' html 요소 생성
	chatBubble.classList.add('userInput'); // chatBubble에 'userInput' 클래스가 없다면 생성 + 만든 요소 클래스명 설정정
	chatBubble.innerHTML = input; // 입력값(input)을 createBubble에 넣기 -> <li> input </li> 형태로 담김
	chatList.appendChild(chatBubble) // chatlist 클래스에 chatBubble 추가(자식으로)
	
	//responseText(input);
	checkInput(input); // 파라미터로 input을 받는 checkInput 함수 실행
}


    //내가 만든함수 오류있을 수 있음 확인필요
    function buttonchat1(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button1.value;
    chatList.appendChild(chatBubble)
    checkInput(button1.value);
    }
    function buttonchat2(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button2.value;
    chatList.appendChild(chatBubble)
    checkInput(button2.value);
    }
    function buttonchat3(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button3.value;
    chatList.appendChild(chatBubble)
    checkInput(button3.value);
    }
    function buttonchat4(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button4.value;
    chatList.appendChild(chatBubble)
    checkInput(button4.value);
    }
    function buttonchat5(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button5.value;
    chatList.appendChild(chatBubble)
    checkInput(button5.value);
    }
    function buttonchat6(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button6.value;
    chatList.appendChild(chatBubble)
    checkInput(button6.value);
    }
    function buttonchat7(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button7.value;
    chatList.appendChild(chatBubble)
    checkInput(button7.value);
    }
    function buttonchat8(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button8.value;
    chatList.appendChild(chatBubble)
    checkInput(button8.value);
    }
    function buttonchat9(){
    var chatBubble = document.createElement('li');
    chatBubble.classList.add('userInput');
    chatBubble.innerHTML = button9.value;
    chatList.appendChild(chatBubble)
    checkInput(button9.value);
    }

var checkInput = function(input) { // 파라미터로 input을 받는 checkInput 함수 생성
	hasCorrectInput = false; // 기본값 위에서 false로 설정함
	isReaction = false; // 기본값 위에서 false로 설정함
	for(var textVal in possibleInput){ // textVal 루프변수에 possibleInput 객체의 프로퍼티명 차례대로 대입
		//indexOf는 찾는 문자열이 존재한다면 문자열 시작위치 반환, 존재하지 않는다면 -1 반환)	
		if(input == "yes" || input.indexOf("yes") >= 0){ // input값이 yes이거나, input에 "yes"문자열이 포함되어있다면
  			if(previousInput == textVal) { // previousInput값이 textVal과 같다면
    			console.log("sausigheid"); // 콘솔창에 "sausigheid" 출력 

    			isReaction = true; // 위에서 false로 설정한 isReaction true로 설정
    			hasCorrectInput = true; // 위에서 true로 설정한 hasCorrectInput true로 설정 
    			botResponse(textVal); // textVal을 파라미터로 받는 botResponse 실행
  			}
		}

		if(input == "no" && previousInput == textVal){ // 입력값이 no이고, previousInput이 textVal과 같다면
			defaultCommReaction = "For a list of commands type: Commands"; // defaultCommReaction에 "문자열"로 설정
			defaultCommand("I'm sorry to hear that :(") // "문자열"을 파라미터로 받는 defaultCommand 실행
			defaultCommand(defaultCommReaction); // defaultCommReaction을 파라미터로 받는 defaultCommand 실행
			hasCorrectInput = true; // hsCorrecInput true로 설정
		}
		
		if(input == textVal || input.indexOf(textVal) >=0 && isReaction == false){
			// input이 textVal과 같거나, input에서 찾는 문자열에 textVal이 포함되어있고 isReaction이 false라면,
				console.log("succes"); // 콘솔창에 "succes" 출력
		  hasCorrectInput = true; // hasCorrectInput true로 설정
		  botResponse(textVal); // textVal을 파라미터로 받는 botResponse 실행
		  
		}
	}
	
	if(hasCorrectInput == false){ // hasCorrectInput이 false라면,
		console.log("failed"); // 콘솔창에 "failed" 출력
		defaultCommand(defaultCommReaction); // defaultCommReaction을 파라미터로 받는 unkwnCommand 실행
		hasCorrectInput = true; // hasCorrectInput true로 설정
	
	}
}

function botResponse(textVal) { // textVal을 파라미터로 받는 botResponse 함수
	var userBubble = document.createElement('li'); // userBubble html요소 'li'로 생성
	userBubble.classList.add('bot__output'); // userBubble에 'bot__output' 클래스가 없으면 생성
	// userBubble.appendChild('.question') 내가 넣은 코드. 필요x
	
	if(isReaction == true){ // isReaction이 true라면
		if (typeof reactionInput[textVal] === "function") { // textVal을 파라미터로 받은 reactionInput이 "function"이라면 
			userBubble.innerHTML = reactionInput[textVal](); // reactionInput[textVal] 실행결과 값을 userBubble에 넣음
		} else {
			userBubble.innerHTML = reactionInput[textVal]; // 위와 차이를 잘 모르겠음
		}
	}

	if(isReaction == false){ // isReaction이 false라면
		if (typeof possibleInput[textVal] === "function") { // textVal을 파라미터로 받은 possibleInput이 "function"이라면
			// console.log(possibleInput[textVal] +" is a function");
			userBubble.innerHTML = possibleInput[textVal](); // possibleInput[textVal] 실행결과 값을 userBubble에 넣음
		} else {
	  		userBubble.innerHTML = possibleInput[textVal]; // 위와 차이를 잘 모르겠음
		}
	}
	chatList.appendChild(userBubble) // chatList에 userBubble을 자식으로 추가

	textInput.value = ""; // 테스트 입력창(chatbox) 비우기
}

function defaultCommand(defaultCommReaction) { // defaultCommReaction을 파라미터로 받는 unknwonCommand 함수 생성
	var defaultResponse = document.createElement('li'); // defaultResponse html 'li' 요소로 생성
	defaultResponse.classList.add('bot__output'); // defaultResponse에 'bot_output'클래스가 없다면 생성
	defaultResponse.classList.add('bot__output--failed'); // defaultResponse에 'bot_output--failed'클래스가 없다면 생성 
	defaultCommReaction = textInput.value.toLowerCase()
	///////// 답변을 defaultCommReaction에 넣어주기.
	//defaultResponse.innerHTML = answer;
	defaultResponse.innerHTML = "\"" + defaultCommReaction + "\" 라고 입력하셨습니다."; // unknCommReaction 값을 defaultResponse에 넣기
	chatList.appendChild(defaultResponse) // chatList에 defaultResponse 자식으로 추가
	
	animateBotOutput(); // animateBotOutput 함수 실행
	
	textInput.value = ""; // 텍스트 입력창 비우기
	
	// scrollHeight : 스크롤이 가능한 높이 scrollTop : 스크롤바로 가려져서 보이지 않는 위쪽 높이
	chatList.scrollTop = chatList.scrollHeight; // 스크롤바 최하단에 고정
	animationCounter = 1; // animationCounter 1로 설정
}

function responseText(e) { // e를 파라미터로 받는 responseText 함수

	var response = document.createElement('li'); // response html 'li' 요소로 생성
	response.classList.add('bot__output'); // response에 'bot__output' 클래스가 없으면 생성
	response.innerHTML = e; // response에 e값 설정
	chatList.appendChild(response); // chatList에 response 자식으로 추가
	animateBotOutput(); // animateBotOutput 함수 실행
	
	setTimeout(function() { // (function, 0)을 파라미터로 받는 setTimeout 기능
		chatList.scrollTop = chatList.scrollHeight; // 스크롤바 최하단에 고정
		console.log(response.clientHeight); // 스크롤바를 포함한 영역 안의 총 길이 콘솔에 출력
	}, 0)
}

/*
    function responseImg(e) { //이미지 응답
    var image = new Image();

    image.classList.add('bot__output');
    image.classList.add('bot__outputImage');
    //이미지 가져오기
    image.src = "/images/"+e;
    chatList.appendChild(image);

    animateBotOutput()
    if(image.completed) {
        chatList.scrollTop = chatList.scrollTop + image.scrollHeight;
    }
    else {
        image.addEventListener('load', function(){
        chatList.scrollTop = chatList.scrollTop + image.scrollHeight;
        })
    }
    }
*/
    //nth-child loop 반복으로 변경 (ul 아래 li 태그들을 반복시켜 스타일을 적용할 때 유용한 코드래)
    //위에 css코드 보면 .chatlist .bot__output:nth-child(1) 이런식으로 애니메이션 설정 되있음

function animateBotOutput() { // animateBotOutput 함수 생성
	chatList.lastElementChild.style.animationDelay= (animationCounter * animationBubbleDelay)+"ms"; 
	// chatList 마지막 자식의 스타일의 애니메이션 지연시간 설정 (animationCounter 정수 x animationBubbleDelay 밀리초로)
	animationCounter++; // 애니메이션 카운터 1 증가
	chatList.lastElementChild.style.animationPlayState = "running";
	// 애니메이션 재생 상태 running(재생)으로 설정
	}

function commandReset(e){ // e를 파라미터로 받는 commandReset 함수 생성
	animationCounter = 1; // 애니메이션 카운터 1로 설정
	previousInput = Object.keys(possibleInput)[e]; // possibleInput의 e번째 속성에 해당하는 문자열 반환
}
    var possibleInput = {
    "학사일정" : function(){
        responseText("6월 학사일정")
        responseText('06.07 ~ 06.13 1학기 보강기간(15주차)\
        06.10 개교기념일&nbsp;06.14 ~ 06.20 1학기 기말고사기간(16주차)\
        06.14 ~ 06.24 1학기 성적입력기간\n06.27 ~ 06.28 1학기 성적열람 및 이의신청기간\
        06.27 ~ 07.15 하계 계절학기 개시 및 수강기간\
        06.29 ~ 06.301학기 성적정정 및 성적열람기간 ');
        responseText("<a href='http://hm.seoil.ac.kr/74' target='_open'>전체일정 바로가기</a>");
        commandReset(0);
        return
        },
    "등록금 안내" : function(){
        responseText("등록금 안내");
        responseText('2022학년도 1학기 재학생 등록금 안내\
        1.등록기간 : 2학기 정보로 추가 예정\
        2.납부가능시간 \n-자세한사항은 학교 공지사항을 확인하세요:)');
        responseText('등록금 납부 방법은 개인별 고지서를 확인한 후 학교 가상계좌로 입금하면 됩니다! \n 납부해야하는 등록금과 입금 계좌는 [] ->[] -> [] 메뉴에서 확인하실 수 있어요~');
        responseText('서일대학교 홈페이지 -> [서일광장] -> [서일소식] -> [학사공지] 를 통해 확인할 수 있어요\
					-신청기간 : \
					-분할납부 고지서 출력 방법 : ');
		responseText('지금까지 납부한 등록금 내역을 확인해볼까요?');
		responseText('등록금 환불/반환은 반환 사유가 발생했을 때 가능합니다.\
						반환사유가되는 대표적은 상황을 알려드릴게요\
						자세한 사항은 url을 통해 확인해 주세요!');
        commandReset(1);
        return
        },
    "교내 연락처" : function(){
        responseText("우리학교 연락처");
        responseText('자세한 정보는 로그인을 하지 않으면 이용할 수 없어요!');
        responseText("버튼0. 로그인홈페이지");
        responseText("버튼1. 학과연락처(http://hm.seoil.ac.kr/109?group=%ED%95%99%EA%B3%BC)");
        responseText("버튼2. 부속기관(http://hm.seoil.ac.kr/109?group=%EB%B6%80%EC%86%8D%EA%B8%B0%EA%B4%80)");
        responseText("버튼3. 부설기관(http://hm.seoil.ac.kr/109?group=%EB%B6%80%EC%84%A4%EA%B8%B0%EA%B4%80)");
        commandReset(2);
        return
        },
    "캠퍼스 맵" : function(){
        responseText("캠퍼스 맵");
        responseText("* 서일대학교 캠퍼스를 안내해드릴게요!");
        responseText("서일대학교 : 서울특별시 중랑구 용마산로 90길 28 | 우편번호 02192 | 전화번호 : 02-490-7300");
        responseText("가까운 역 : 7호선 면목역 2번 출구, 1호선 청량리역 ");
        responseText("버스 안내 : [간선] 271(상암동<->서일대) [지선] 2013(상왕십리역<->서일대) 2230(청량리역) <->서일대) 1213(국민대앞<->서일대)");
        responseText("http://hm.seoil.ac.kr/116 | [ 서일대학교 가는 길 ]");
        responseText("* 전화번호 및 영업시간은 아래 버튼을 통해 확인해주세요~ :) ");
        responseText("http://hm.seoil.ac.kr/109 | [ 전화번호 안내 ]");
        responseText("http://hm.seoil.ac.kr/115 | [ 캠퍼스 안내]");
        responseText("캠퍼스 맵");
        commandReset(3);
        return
    },
    "학점관리" : function(){
        responseText("학점관리");
        responseText("* 이수한 학점에 대해서 알아볼까요?");
        responseText("이수한 학점은 [종합정보시스템]→[성적관리]→[누계성적관리]로 들어가면 확인할 수 있습니다!");
        responseText("학점 계산은 에브리타임 어플리케이션을 통해 계산하거나 [종합정보시스템]→[성적관리]→[누계성적관리]로 들어가시면 확인할 수 있습니다!");
        responseText("http://hm.seoil.ac.kr/80/95/?category_idno=539 [ 학점 ]");
        responseText("* 이수 가능한 학점에 대해서 알려드릴게요!");
        responseText("19학번 이상부터 2년제는 75학점 (교양 6~10학점), 3년제는 110학점 (교양 8~14학점), 4년제는 130학점 (교양 25~28학점)을 수강해야 하며, 학 학기당 15학점부터 21학점까지 신청 가능합니다!");
        responseText("* 학사 경고를 받았을 경우, 일부 혜택을 받는 데에 제한이 있을 수 있으며, 학사 경고를 연속해서 2번 받을 경우 유급되며, 학사경고자 명단은 학과 사무실에서 확인 가능합니다.");
        responseText("* 학점으로 인정받을 수 있는 봉사활동에 대해서 알려드릴게요!");
        responseText("1365 자원봉사 포털에 탑재된 기관이거나 연동 가능할 경우 인정하며, 개인 시설이나 미인가 시설은 인정하지 않습니다. 성적 처리는 교양교육센터장이 사회봉사활동 확인서 및 사회봉사 실습 보고서를 검토한 후 이상이 없을 시 학점을 부여합니다. 교내에서 진행하는 서일 인성 특강을 한 차례 이상 이수하는 것을 권장하며, 수강신청하지 않은 봉사활동은 학점으로 인정되지 않습니다. 자세한 사항은 본 교양교육센터(02-490-7555)로 문의 주세요.");
        commandReset(4);
        return
    },
    "장학금 안내" : function(){
        responseText("장학금 안내");
        responseText("장학금에 대한 정보를 알려드릴게요! :)");
        responseText("신청 가능한 장학금들로는 국가장학금, 서울희망장학금, 호천 장학금, 지덕배양 장학금, 초지일관 장학금, 보훈 장학금, 서일사랑장학금, su포인트 장학금, 재직자녀 장학금, 공로장학금, 학보사 장학금, 방송국 장학금, 서일도움 장학금, 서일가족 장학금, 전공심화입학 장학금, 세움 장학금, 돋움 장학금, 서일지킴이 장학금, 자매결연해외학기제 장학금, 산업체위탁교육 장학금, 외국인 장학금, 창업 장학금, 성적향상 장학금, 탈북대학생 장학금, 주경야독 장학금, 홍보대사 장학금 등이 있습니다.");
        responseText("교내에서 신청 가능한 장학금들로는 과대 장학금, 호천 장학금, 지덕배양 장학금, 초지일관 장학금, 보훈 장학금, 서일사랑장학금, su포인트 장학금, 재직자녀 장학금, 공로장학금, 학보사 장학금, 방송국 장학금, 서일도움 장학금, 서일가족 장학금, 전공심화입학 장학금, 세움 장학금, 돋움 장학금, 서일지킴이 장학금, 자매결연해외학기제 장학금, 산업체위탁교육 장학금, 외국인 장학금, 창업 장학금, 성적향상 장학금, 탈북대학생 장학금, 주경야독 장학금, 홍보대사 장학금 등이 있습니다.");
        responseText("장학금에 대한 최신 정보는 과 단톡방이나 아래 페이지를 통해 확인해주세요!");
        responseText("http://hm.seoil.ac.kr/70 | [서일장학공지]");
        responseText("http://hm.seoil.ac.kr/80/95/?category_idno=540 | [장학금 문의 사이트]");
        responseText("장학금 수혜에 대해 알려드릴게요");
        responseText("현 수혜 내역은 아래 버튼으로 들어가 종합정보시스템 → 장학관리로 들어가시면 확인할 수 있습니다!");
        responseText("https://stis.seoil.ac.kr/stis/xstart.jsp?epTicket=LOG | [장학금 수혜내역]");
        responseText("등록금의 금액까지 지급받을 수 있으며, 전액 장학금을 받았을 때 추가적인 수혜는 불가능합니다.");
        responseText("또, 한도 내까지는 동시 수혜가 가능하나 동일한 종류 내에서는 이중으로 지급받을 수 없습니다.");
        responseText("장학금 수령 방식은 학생이 정할 수 없습니다. 학기 초에 등록금 고지서 작업 이전에 지급되는 장학금은 선감면되며, 그 이후에 나오는 장학금들은 학생에게 개별적으로 지급됩니다.");
        responseText("어떤 장학금들이 있는지 알려드릴게요!");
        responseText("* 국가 장학금 --> \
						한국장학재단 내의 일정한 선발기준을 거쳐 지급되는 장학금입니다. 국가장학금 고객지원 상담센터 번호는 1599-2000, 국가장학금 문의를 위한 학생지원처는 02-490-7363, 성적 관련 문의는 교무처인 02-490-7554로 문의 주시면 됩니다. 자세한 사항은 아래의 버튼에 연결된 한국장학재단 사이트를 통해 확인 바랍니다!\
						https://www.kosaf.go.kr | [한국장학재단]");
        responseText("* 복지 장학금 -->\
						국가 장학금을 신청했을 경우 따로 신청이 필요 없으며, 미 신청 시 학과 측의 복지 장학금 신청 공지에 맞춰 필요한 서류를 학과로 제출해주시면 됩니다. 기준은 한국장학재단에서 선정한 소득분위와 기준 성적 2.0 이상으로 심사됩니다. 소득 분위가 해당되지 않거나 등록금 범위를 넘길 경우 지급되지 않을 수 있습니다.");
        responseText("* 성적 장학금 -->\
						지덕배양장학금, 호천장학금 등이 있으며 석차순으로 교양 + 전공의 총 성적 순으로 지급됩니다. 등록금에서 선차감되는 방식으로, 대출이 없을 경우 학생 본인의 계좌로 지급되며 미등록 휴학 시 반환 처리 됩니다. 휴학 중에도 성적 장학금 혜택을 받고자 할 경우 등록 휴학을 해주시기 바랍니다.");
        responseText("* 봉사 장학금 -->\
						학생 자치활동 등의 활동을 하는 학생들을 대상으로 하는 등록금성 장학금으로 학기 말에 학생 계좌 혹은 학자금 대출 상환 형식으로 지급됩니다.");
        responseText("* su 포인트 장학금 -->\
						매년 2학기 말에 서일 su 시스템 상 누적된 포인트가 많은 학생에게 지급하는 장학금으로 별도의 신청이 필요하지 않습니다. 종강 후 평균적으로 한 달 반 이후에 지급되며, 1월 말 혹은 2월 중순에 등록된 계좌로 지급됩니다. 지급 조건은 재학생 역량 강화 프로그램을 수강하여 일반 학과의 경우 포인트 150점 이상을, 특성화 학과의 경우 포인트 180점 이상을 충족해야 합니다. 지급액은 별도로 책정되며 20만원에서 100만원 가량 지급됩니다.");
        responseText("* 신입생특별 장학금 -->\
						정원 내 전형 중 수시와 정시 전형으로 입학한 학생 중 수석과 차석에게 지급하는 전체 수석 및 차석 장학금과 정원 내 전형 중 수시 및 정시에서 학과 최고성적으로 선발된 학생에게 지급되는 학과 수석 장학금이 있습니다.");
        responseText("* 금연 장학금 -->\
						금연 장학금은 매년 1학기에 신청 받습니다. 해당 학기가 끝난 후, 등록금에서 차감되어 지급됩니다.");
        responseText("* 국가근로 장학금 -->\
						한국장학재단의 성적 기준과 소득분위에 따라 심사가 되며, 학교에서 하는 교내 근로 장학생의 경우 각 부서에서 채용 후 관리하게 됩니다.");
        commandReset(5);
        return
    },
    "e-Campus" : function(){
        responseText("e-Campus에선 학습 중인 강의의 과제, 자료, 출석부 등을 열람할 수 있어요.");
        responseText("<a href='https:ecampus.seoil.ac.kr' target='_open'>서일대 e-Campus 바로가기");
        commandReset(6);
        return
    },
    "수강신청" : function(){
        responseText("* 수강신청에 대해서 알려드릴게요!");
        responseText("수강신청은 서일대학교 수강신청 홈페이지에서 할 수 있어요. 하단의 버튼을 통해 연결해 드릴게요");
		responseText("20nn-n학기 수강신청 일정 안내\
					20nn학년도 n학기 수강신청 일정을 확인해 주세요.");
		responseText("20nn학년도 n학기 수강신청 일정을 확인해 주세요.");
		responseText("[수강신청 바로가기] https://sugang.seoil.ac.kr/sugang/sugang/doLogin.do");
		responseText("[수강신청 일정 안내] http://hm.seoil.ac.kr/65/77/read?&search_fld=all&search=%EC%88%98%EA%B0%95%EC%8B%A0%EC%B2%AD&idno=596");
		responseText("계절학기 안내드릴게요:>");
		responseText("[서일대학교 교양교육센터]");
		responseText("nn학년도 n학기 교양교과목 개설현황보기 버튼을 참고해주세요");
		responseText("수강신청시 개설현황 참고하여 신청바랍니다!");
		responseText("-문의 : 02-490-7555");
		responseText("<< nn학년도 n학기 교양교과목 개설현황 >>");
		responseText("<<교양 수강신청 바로가기>>");
				
        commandReset(7);
        return
    },
    "도서관" : function(){
        window.location.href = "http://lib.seoil.ac.kr/";
        }
}