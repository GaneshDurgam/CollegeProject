package pack;
public class Block {
	public int id;
	public String data,dataName;
	public String sig;
	public Block(int id, String dataName, String sig) {
		super();
		this.id = id;
		this.dataName = dataName;
		this.sig = sig;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
public String getDataName() {
		return dataName;
	}
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	public String getSig() {
		return sig;
	}
	public void setSig(String sig) {
		this.sig = sig;
	}
public String toString()
	{
		return id+"-"+dataName+"-"+sig;
		
	}
	
}
