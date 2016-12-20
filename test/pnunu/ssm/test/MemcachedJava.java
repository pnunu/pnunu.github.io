package pnunu.ssm.test;

//http://www.runoob.com/memcached/java-memcached.html
public class MemcachedJava {
	/*
	 * public static void main(String[] args) { try { // 本地连接 Memcached 服务
	 * MemcachedClient mcc = new MemcachedClient(new
	 * InetSocketAddress("127.0.0.1", 11211)); System.out.println(
	 * "Connection to server sucessful."+mcc);
	 * 
	 * // 关闭连接 mcc.shutdown();
	 * 
	 * } catch (Exception ex) { System.out.println(ex.getMessage()); } }
	 */
	/*
	 * public static void main(String[] args) {
	 * 
	 * try{ // 连接本地的 Memcached 服务 MemcachedClient mcc = new MemcachedClient(new
	 * InetSocketAddress("127.0.0.1", 11211)); System.out.println(
	 * "Connection to server sucessful.");
	 * 
	 * // 存储数据 Future fo = mcc.set("runoob", 900, "Free Education");
	 * 
	 * // 查看存储状态 System.out.println("set status:" + fo.get());
	 * 
	 * // 输出值 System.out.println("runoob value in cache - " +
	 * mcc.get("runoob"));
	 * 
	 * // 关闭连接 mcc.shutdown();
	 * 
	 * }catch(Exception ex){ System.out.println( ex.getMessage() ); } }
	 */

	/*
	 * public static void main(String[] args) { try { // 连接本地的 Memcached 服务
	 * MemcachedClient mcc = new MemcachedClient(new
	 * InetSocketAddress("127.0.0.1", 11211)); System.out.println(
	 * "Connection to server sucessful.");
	 * 
	 * // 添加数据 Future fo = mcc.set("runoob", 900, "Free Education");
	 * 
	 * // 打印状态 System.out.println("set status:" + fo.get());
	 * 
	 * // 输出 System.out.println("runoob value in cache - " + mcc.get("runoob"));
	 * 
	 * // 添加 fo = mcc.add("runoob", 900, "memcached");
	 * 
	 * // 打印状态 System.out.println("add status:" + fo.get());
	 * 
	 * // 添加新key fo = mcc.add("codingground", 900, "All Free Compilers");
	 * 
	 * // 打印状态 System.out.println("add status:" + fo.get());
	 * 
	 * // 输出 System.out.println("codingground value in cache - " +
	 * mcc.get("codingground"));
	 * 
	 * // 关闭连接 mcc.shutdown();
	 * 
	 * } catch (Exception ex) { System.out.println(ex.getMessage()); } }
	 */
	/*
	 * public static void main(String[] args) {
	 * 
	 * try { // 连接本地的 Memcached 服务 MemcachedClient mcc = new MemcachedClient(new
	 * InetSocketAddress("127.0.0.1", 11211)); System.out.println(
	 * "Connection to server sucessful.");
	 * 
	 * // 添加第一个 key=》value 对 Future fo = mcc.set("runoob", 900, "Free Education"
	 * );
	 * 
	 * // 输出执行 add 方法后的状态 System.out.println("add status:" + fo.get());
	 * 
	 * // 获取键对应的值 System.out.println("runoob value in cache - " +
	 * mcc.get("runoob"));
	 * 
	 * // 添加新的 key fo = mcc.replace("runoob", 900, "Largest Tutorials' Library"
	 * );
	 * 
	 * // 输出执行 set 方法后的状态 System.out.println("replace status:" + fo.get());
	 * 
	 * // 获取键对应的值 System.out.println("runoob value in cache - " +
	 * mcc.get("runoob"));
	 * 
	 * // 关闭连接 mcc.shutdown();
	 * 
	 * } catch (Exception ex) { System.out.println(ex.getMessage()); } }
	 */
	/*public static void main(String[] args) {

		try {

			// 连接本地的 Memcached 服务
			MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));
			System.out.println("Connection to server sucessful.");

			// 添加数据
			Future<Boolean> fo = mcc.set("runoob", 900, "Free Education");

			// 输出执行 set 方法后的状态
			System.out.println("set status:" + fo.get());

			// 获取键对应的值
			System.out.println("runoob value in cache - " + mcc.get("runoob"));

			// 对存在的key进行数据添加操作
			fo = mcc.append(900, "runoob", " for All");

			// 输出执行 set 方法后的状态
			System.out.println("append status:" + fo.get());

			// 获取键对应的值
			System.out.println("runoob value in cache - " + mcc.get("codingground"));

			// 关闭连接
			mcc.shutdown();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}*/
}
