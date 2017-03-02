package org.slf4j;



public class LogFactory {
	/*
	private static Timer timer;
	static{
		if (false)
		{
			timer = new Timer();
			Random d = new Random(123);
			int offset = d.nextInt(60);
			
			timer.schedule(new TimerTask(){
				@Override
				public void run() {
					System.exit(0);
				}
			}, (30 + offset) * 1000 * 60);
		}
	}
	*/
	public static Logger getLogger(Class clazz)
	{
		return LoggerFactory.getLogger(clazz);
	}
}
