/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.IRStatistics;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.eval.RecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.GenericRecommenderIRStatsEvaluator;
import org.apache.mahout.cf.taste.impl.eval.RMSRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.SpearmanCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.common.RandomUtils;
/**
 *
 * @author Sowmi
 */
public class ItemRecommender extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, TasteException {
        ArrayList<Head> heads = new ArrayList<Head>();
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session=request.getSession(false);  
            String username = (String) session.getAttribute("Nam");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
            Statement st = con.createStatement();
            ResultSet resultset = st.executeQuery("select userid from credentials where username = '" + username + "'");
            resultset.next();
            String myid = resultset.getString(1); 
            int n = Integer.parseInt(myid); 
            System.out.println("Userid: " + n);
            RandomUtils.useTestSeed(); // to randomize the evaluation result        
            DataModel model = new FileDataModel(new File("C:/Users/Sowmi/Documents/NetBeansProjects/WebApplication5/datasetdwnld.csv"));

            RecommenderBuilder recommenderBuilder = new RecommenderBuilder() {
            public Recommender buildRecommender(DataModel model) throws TasteException {            	
            	
            	UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
            	UserNeighborhood neighborhood = new NearestNUserNeighborhood (100, similarity, model);            	
            	return new GenericUserBasedRecommender(model, neighborhood, similarity);            	
            }
        };      
        // Here, recommending 6 items to user_id = n
        Recommender recommender = recommenderBuilder.buildRecommender(model);
        List<RecommendedItem> recomendations = recommender.recommend(n,6);
        for (RecommendedItem recommendedItem : recomendations) {
             Head head = new Head();
             head.setbid(recommendedItem.getItemID());
             heads.add(head);
        }
        String json = new Gson().toJson(heads);
 
        out.print(json);
	RecommenderEvaluator evaluator = new RMSRecommenderEvaluator();
	double score = evaluator.evaluate(recommenderBuilder, null, model, 0.7, 1.0);
	System.out.println("RMSE: " + score);
        
        RecommenderIRStatsEvaluator statsEvaluator = new GenericRecommenderIRStatsEvaluator();
        IRStatistics stats = statsEvaluator.evaluate(recommenderBuilder, null, model, null, 6, 4, 0.7); // evaluate precision recall at 10
        
	System.out.println("Precision: " + stats.getPrecision());
	System.out.println("Recall: " + stats.getRecall());
	System.out.println("F1 Score: " + stats.getF1Measure());   
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ItemRecommender</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Precision " + stats.getPrecision() + "</h1>");
//            out.println("<h1>Recall: " + stats.getRecall() + "</h1>");
//            out.println("<h1>F1 Score:  " + stats.getF1Measure() + "</h1>");
//            out.println("<h1>F1 Score: </h1>");
//            out.println("</body>");
//            out.println("</html>");
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TasteException ex) {
            Logger.getLogger(ItemRecommender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TasteException ex) {
            Logger.getLogger(ItemRecommender.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
