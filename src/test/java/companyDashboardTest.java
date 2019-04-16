//import com.nsa.evolve.EvolveApplication;
//import com.nsa.evolve.controller.CompanyController;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.web.servlet.MockMvc;
//
//import static org.assertj.core.api.Assertions.assertThat;
//import static org.hamcrest.CoreMatchers.containsString;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest(classes = EvolveApplication.class)
//@AutoConfigureMockMvc
//public class companyDashboardTest {
//
//    @Autowired
//    private CompanyController companyController;
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    @Test
//    public void contextLoads() throws Exception {
//        assertThat(companyController).isNotNull();
//    }
//
//    @Test
//    public void testLoginPage() throws Exception {
//        this.mockMvc.perform(get("/login")).andDo(print()).andExpect(status().isOk())
//                .andExpect(content().string(containsString("login-container")));
//    }
//
//    @Test
//    public void testQviScore() throws Exception {
//        this.mockMvc.perform(get("/company/get-company-qvi/1")).andDo(print()).andExpect(status().isOk());
//    }
//
////    @Test
////    @WithMockUser
////    public void testcompanyDashboard() throws Exception {
////        this.mockMvc.perform(get("/company-dashboard")).andDo(print()).andExpect(status().isOk())
////                .andExpect(content().string(containsString("")));
////    }
//
//}
