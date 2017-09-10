package User;

import info.debatty.java.stringsimilarity.Jaccard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.tartarus.snowball.ext.englishStemmer;

import NaiveBayes.StopwordRemoval;

import database.DatabaseConnection;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, Double> map1 = new HashMap<String, Double>();
		Map<String, Integer> map =new HashMap<String, Integer>();
		HttpSession session = request.getSession();
		Map<String, Double> hashmap = new HashMap<>();
		PrintWriter out = response.getWriter();
		 StopwordRemoval stop=new StopwordRemoval();
         stop.LoadStopWord();
		ArrayList<String> getresultid=new ArrayList<String>();
		String keyword=request.getParameter("Search");
/*************************************************************************/		
/*****************Code for Stop word removal******************************/
/*************************************************************************/				
    	keyword=stop.StopwordRemoval(keyword);
        System.out.println("Stop word remove from comment:-"+ keyword);
/*************************************************************************/		
/**************************Stemming Code************************************/
/*************************************************************************/		
			String[] forstem=keyword.split("\\s");
	        String maincomment="";
	        for(int i=0;i<forstem.length;i++)
	        {
		        englishStemmer stemmer = new englishStemmer();
		        String getword=forstem[i];
		        stemmer.setCurrent(getword);
		        if (stemmer.stem()){
		        	String stemcomment=stemmer.getCurrent();
		        	if(maincomment.equals("")){
		        		maincomment=stemcomment;
		        	}else{
		        		maincomment=maincomment+" "+stemcomment;
		        	}
		            //System.out.println("This is stemmer result"+maincomment);
		        }
	        }
        	String keyword1=maincomment;
        	
/*************************************************************************/  
/*************************************************************************/        	
		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();
		
		String query = "select * from products";
		ResultSet rs = (ResultSet) db.getResultSet(query);
		try {
				while(rs.next())
				{
					String pid=rs.getString("id");
					String pname=rs.getString("pname");
					String des=rs.getString("description");
					String pprice=rs.getString("pprice");
					String description=rs.getString("description")+","+pname;
					
						String[] getonebyone=keyword1.split(" ");
							for(int m=0;m<getonebyone.length;m++)
							{
								if(pname.contains(getonebyone[m]) || des.contains(getonebyone[m]) || pprice.contains(getonebyone[m]))
								{
						/***************************************************************************/			
						/**************************Stemming Code************************************/
						/***************************************************************************/
								String[] forstem1=description.split("\\s");
						        String maincomment1="";
						        for(int i1=0;i1<forstem1.length;i1++)
						        {
						        	//System.out.println("get one word at a time"+forstem[i]);
							        englishStemmer stemmer1 = new englishStemmer();
							        String getword1=forstem1[i1];
							        stemmer1.setCurrent(getword1);
							        if (stemmer1.stem()){
							        	String stemcomment1=stemmer1.getCurrent();
							        	maincomment1=maincomment1+" "+stemcomment1;
							        	if(maincomment.equals("")){
							        		maincomment1=stemcomment1;
							        	}else{
							        		maincomment1=maincomment1+" "+stemcomment1;
							        	}
							            //System.out.println("This is stemmer result"+maincomment);
							        }
						        }
						        description=maincomment1;
			
						       // Code for Stop word removal//
						        String description1=stop.StopwordRemoval(description);
						        System.out.println("Stop word remove from description:-"+ description1);
						/*************************************************************************/
						/*************************************************************************/			        
								String[] onedesc=description1.split(",");
								double result=0.0;
								double maxresult =0.0;
								int j=0;
								int i=0;
								ArrayList<Double> simresultadd = new ArrayList<Double>();
			
						/*************************************************************************/
						/*********Description,Functional & Characterstics Similarity**************/
						/*************************************************************************/
									Jaccard sim=new Jaccard();
									result=sim.similarity(keyword1,onedesc[i]);
//									System.out.println("jaccard result "+ result);
									match mt =new match();
									double dis =mt.computeEditDistance(getonebyone[m], onedesc[i]);
									map1.put(pid, dis);
//									simresultadd.add(dis);
						/*************************************************************************/
						/*************************************************************************/
								}
							}
				}
				
				 map=sortByValues(map1);
				 System.out.println("After Sorting:");
			      Set set2 = map.entrySet();
			      Iterator iterator2 = set2.iterator();
			      while(iterator2.hasNext()) {
			           Map.Entry me2 = (Map.Entry)iterator2.next();
			           System.out.print(me2.getKey() + ": ");
			           System.out.println(me2.getValue());
			      }
			      System.out.println("Hash Map Values"+map);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		double maxValueInMap = (Collections.max(hashmap.values()));  // This will return max value in the Hashmap
//        for (Map.Entry<String, Double> entry : hashmap.entrySet()) {// Itrate through hashmap
//            if (entry.getValue() <= maxValueInMap) {
//               	String productid = entry.getKey();
//               	getresultid.add(productid);
//            }
//        }
//        System.out.println("this per one maxreid"+getresultid);
		session.setAttribute("searchresult", map);
		response.sendRedirect("user/search.jsp");
	}
	
	private static  HashMap sortByValues(Map<String, Double> map1) { 
		 List list = new LinkedList(map1.entrySet());
	       // Defined Custom Comparator here
	       Collections.sort(list, new Comparator() {
	            public int compare(Object o1, Object o2) {
	               return ((Comparable) ((Map.Entry) (o2)).getValue())
	                  .compareTo(((Map.Entry) (o1)).getValue());
	            }
	       });

	       // Here I am copying the sorted list in HashMap
	       // using LinkedHashMap to preserve the insertion order
	       HashMap sortedHashMap = new LinkedHashMap();
	       for (Iterator it = list.iterator(); it.hasNext();) {
	              Map.Entry entry = (Map.Entry) it.next();
	              sortedHashMap.put(entry.getKey(), entry.getValue());
	       } 
	       return sortedHashMap;
	  }

}
