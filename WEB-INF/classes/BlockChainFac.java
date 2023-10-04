package pack;
import java.util.*;
import java.sql.*;
public class BlockChainFac
{
public static void updateBCSig()
{
	try{
              Connection con = Db.getConnection();
                                Statement st = con.createStatement();
                                String query = "select id,file_name,status,date1,userid,AES_DECRYPT(data,'key') from file1";
		ResultSet rs = st.executeQuery(query);
		TreeMap<Integer,Block> blockchain=new TreeMap<Integer,Block>();
		


int i=0;
String p="000000";
while (rs.next()) {
int id=rs.getInt(1);
String  file=rs.getString(2);
String     status=rs.getString(3);
String   date1=rs.getString(4);
String userid=rs.getString(5);
Blob file2=rs.getBlob(6);
byte[] bdata = file2.getBytes(1, (int)file2.length());
String data = new String(bdata);
String sig=data.hashCode()+"";
		Block b=new Block(id,file,p);
		b.setData(data);
		blockchain.put(i,b);
		i++;
                                    }
Block fb=blockchain.get(0);
Block lb=blockchain.get(blockchain.size()-2);
String lbs=(lb.getData()+lb.getSig()).hashCode()+"";
fb.setSig(lbs);
		

for(i=1;i<blockchain.size();i++)
{
Block pb=blockchain.get(i-1);
Block nb=blockchain.get(i);
String pbs=(pb.getData()+pb.getSig()).hashCode()+"";
nb.setSig(pbs);
blockchain.put(i,nb);
}

st.execute("delete from  BlockChain");

		
		for(int ki:blockchain.keySet())
		{
		Block b=blockchain.get(ki);
st.execute("INSERT INTO BlockChain(id,DataName,bSignature) VALUES("+b.getId()+",'"+b.getDataName()+"','"+b.getSig()+"')");
System.out.println(b);
		}
		}catch(Exception ex){System.out.println("BC:"+ex);}
}
}