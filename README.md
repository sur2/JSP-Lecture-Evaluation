# JSP-Lecture-Evaluation
나동빈님의 'JSP 강의평가 웹 사이트  개발하기' 강좌 



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

