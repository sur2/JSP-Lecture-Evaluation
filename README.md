# JSP-Lecture-Evaluation
### 나동빈님의 'JSP 강의평가 웹 사이트  개발하기' 강좌 

### http://34.69.65.28:8081/Lecture_Evaluation

javax.mail.* 패키지, util.Gmail을 사용한 Gmail를 Google Cloud Platform으로 배포하니 Server 국적으로 로그인 시도가 감지되어 활동을 차단합니다. Gmail를 사용한 이메일 인증 기능인 회원가입과 신고 기능이 중단되었습니다.



## Design Pattern
### Singleton Pattern
```
public class DatabaseUtil {

	private DatabaseUtil() {}
	
	// JVM은 내부 클래스를 초기화하기 위해 필드 접근을 동기화한다. 그러므로 다 수의 스레드에서 동시에 접근 불가능하다.
	private static class LazyHolder {
		public static final DatabaseUtil INSTANCE = new DatabaseUtil();
	}
	// getInstance() 함수가 호출되는 시점에서 Singleton Holder가 참조되어 Singleton 객체가 생성
	public static DatabaseUtil getInstance() {
		return LazyHolder.INSTANCE;
	}
}
```



## XSS 방어

### XSS 공격 Cross-site-Scripting 

웹 상에서 가장 기초적인 취약점 공격 방법의 일종으로, 악의적인 사용자가 공격하려는 사이트에 스크립트를 넣는 기법

### 방어법

``<script></script>`` 구문이 작성될 경우 다른 문자로 취환

String object``.replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\r\n", "<br>")``



## PSCP

pscp -i ppk-for-gcp.ppk -r C:\Users\Owner\Desktop\Lecture_Evaluation.war pyong-lab@34.69.65.28:



### Local to Docker Container cp

 docker cp Lecture_Evaluation.war gcp-tomcat:/usr/local/tomcat 