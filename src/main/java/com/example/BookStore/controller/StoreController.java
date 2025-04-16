package com.example.BookStore.controller;

import com.example.BookStore.Repository.*;
import com.example.BookStore.Request.*;
import com.example.BookStore.Services.StoreServices;
import com.example.BookStore.entities.*;
import jakarta.mail.MessagingException;
import jakarta.mail.Store;
import jakarta.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.print.Book;
import java.io.IOException;
import java.util.List;

@Controller
public class StoreController {

    @Autowired
    private StoreServices storeServices;
    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private CategoriesRepository categoriesRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private AddressReposiotry addressReposiotry;

    @Autowired
    private OrdersRepository ordersRepository;

    @GetMapping("/adminlogin")
    public String AdminView() {
        return "/adminlogin";
    }

    @PostMapping("/submitLogin")
    public String adminLoginSubmit(AdminLoginRequest adminLoginRequest, HttpSession session, Model map) {
        return storeServices.adminLogin(adminLoginRequest, session, map);
    }

    @GetMapping("/admindashboard")
    public String adminDash(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            long bookCount = bookRepository.count();
            long categoriesCount = categoriesRepository.count();
            long ordersCount = ordersRepository.count();
            map.addAttribute("books", bookCount);
            map.addAttribute("categories", categoriesCount);
            map.addAttribute("orders", ordersCount);
            return "/admindashboard";
        }
        return "redirect:/adminlogin";
    }

    @GetMapping("/addbook")
    public String add(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            List<Categories> categories = categoriesRepository.findAll();
            map.addAttribute("categoryList", categories);
            return "/addbook";
        }
        return "redirect:/adminlogin";
    }
    @PostMapping("/addnewbook")
    public String addbook(Addbook add) {
        return storeServices.addNewBook(add);
    }

    @GetMapping("/profile")
    public String adminProfile(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return "/profile";
        }
        return "redirect:/adminlogin";
    }

    @GetMapping("/logout")
    public String logoutAdmin(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            session.invalidate();
        }
        return "redirect:/adminlogin";
    }

    @GetMapping("/updatepassword")
    public String upPassword(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return "updatepassword";
        }
        return "redirect:/adminlogin";
    }

    @PostMapping("/submitPasswordChange")
    public String changePassword(ResetAdminPassword resetAdminPassword, HttpSession session, Model map) {
        return storeServices.resetPassword(resetAdminPassword, session, map);
    }

    @GetMapping("/categories")
    public String categoriesView(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            List<Categories> categories = categoriesRepository.findAll();
            map.addAttribute("categories", categories);
            return "categories";
        }
        return "adminlogin";
    }

    @GetMapping("/addcategory")
    public String addcategoryView(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return "addcategory";
        }
        return "adminlogin";
    }

    @PostMapping("/addcategories")
    public String addcategory(HttpSession session, AddCategory addCategory, Model map) {
        return storeServices.addNewCategory(session, addCategory, map);
    }

    @GetMapping("/update/{id}")
    public String upcategoryView(@PathVariable int id, HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            Categories cat = categoriesRepository.findByid(id);
            map.addAttribute("upcategory", cat);
            return "updatecategory";
        }
        return "adminlogin";
    }

    @PostMapping("/edit/{id}")
    public String updateCategories(@PathVariable int id, HttpSession session, UpdateCategory updateCategory, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            return storeServices.updateCategory(id, updateCategory, map);
        }
        return "adminlogin";
    }

    @GetMapping("/books")
    public String booksView(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            List<Books> books = bookRepository.findAll();
            for(Books book : books){
                Categories cat = categoriesRepository.findByid(book.getCategory());
                book.setCategoryName(cat.getName());
            }
            map.addAttribute("Books", books);
            return "bookview";
        }
        return "adminlogin";
    }
    @GetMapping("/orders")
    public String ordersView(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            List<Orders> orders = ordersRepository.findAll();
            map.addAttribute("orders", orders);
            return "orders";
        }
        return "adminlogin";
    }

    @GetMapping("/updateprofile")
    public String updateProfileView(HttpSession session, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
            String imgurl = "/images/profile/"+admin.getProfile();
            map.addAttribute("imgurl",imgurl);
            return "updateprofile";
        }
        return "adminlogin";
    }

    @PostMapping("/submitProfileUpdate")
    public String updateProfile(HttpSession session,Model map,UpdateAdmin updateAdmin){
        return storeServices.updateAdminProfile(session,map,updateAdmin);
    }
    @PostMapping("/delete/{id}")
    public String deleteCategories(@PathVariable int id, HttpSession session, UpdateCategory updateCategory, Model map) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null) {
           Categories cat = categoriesRepository.findByid(id);
           categoriesRepository.delete(cat);
           return "redirect:/categories";
        }
        return "adminlogin";
    }
    @GetMapping("/updatebook/{id}")
    public String updateBookView(@PathVariable int id, HttpSession session, Model map){
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin!=null){
            Books books = bookRepository.findById(id);
            map.addAttribute("books",books);
            List<Categories> categories = categoriesRepository.findAll();
            map.addAttribute("categories", categories);
            return "updatebook";
        }
        return "adminlogin";
    }
    @PostMapping("/update/{id}")
    public String updateBook(HttpSession session,UpdateBook updateBook,@PathVariable int id){
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin!=null){
            return storeServices.updateBook(session,updateBook,id);
        }
        return "adminlogin";
    }
    @PostMapping("/deletebook/{id}")
    public String deleteBook(@PathVariable int id,HttpSession session){
        Books books = bookRepository.findById(id);
        if(books!=null){
            bookRepository.delete(books);
            return "redirect:/books";
        }
        return "admindashboard";
    }
    @GetMapping("/adminbookview/{id}")
    public String adminView(@PathVariable int id,HttpSession session,Model map){
        Orders order =  ordersRepository.findById(id);
        if(order!=null){
            Books book = bookRepository.findById(order.getItemId());
            map.addAttribute("book",book);
            Address address = addressReposiotry.findByEmail(order.getUserId());
            map.addAttribute("address", address);
            return "adminbookview";
        }
        return "orderView";
    }
    @GetMapping("/signup")
    public String userSignupView(){
        return "usersignup";
    }
    @PostMapping("/usersignup")
    public String userSignup(HttpSession session,NewUser newUser, Model map){
        return storeServices.addNewUser(session,newUser,map);
    }
    @GetMapping("/index")
    public String indexView(HttpSession session,Model map){
        List<Categories> categories = categoriesRepository.findAll();
        map.addAttribute("categoryList", categories);
        List<Books> books = bookRepository.findTop3ByOrderByIdDesc();
        map.addAttribute("books",books);
        return "index";
    }
    @GetMapping("/login")
    public String loginView(){
        return "userlogin";
    }
    @PostMapping("/userlogin")
    public String login(HttpSession session,Model map,UserLogin userLogin){
        return storeServices.userLogin(session,map,userLogin);
    }
    @GetMapping("/userlogout")
    public String userLogout(HttpSession session){
        Users user =(Users) session.getAttribute("user");
        if(user!=null){
            session.invalidate();
            return "redirect:/login";
        }
        return "usersignup";
    }
    @GetMapping("/resetpassword")
    public String resetPasswordView(){
        return "resetpassword";
    }
    @PostMapping("/resetPasswordRequest")
    public String resetPassword(ResetUserPassword resetUserPassword,Model map) throws IOException, MessagingException {
        return storeServices.resetUserPassword(resetUserPassword,map);
    }
    @GetMapping("/confirmpassword/{encodedEmail}")
    public String confirmpasswordView(@PathVariable String encodedEmail){
        return "/confirmpassword";
    }
    @PostMapping("/confirmpassword/{encodedEmail}")
    public String confirmpassword(@PathVariable String encodedEmail,String newpassword,Model map){
        return storeServices.setUserPassword(encodedEmail,newpassword,map);
    }
    @GetMapping("/emailverification")
    public String verificationView(HttpSession session,Model map,OtpRequest request){
        storeServices.sendVerification(session,request);
        return "emailauthentication";
    }
    @PostMapping("/verifyotp")
    public String verifyOtp(HttpSession session,Model map, OtpRequest request){
        return storeServices.otpValidation(session,map,request);
    }
    @GetMapping("/shopbooks")
    public String booksDisplay(HttpSession session,Model map){
        Users user = (Users)session.getAttribute("user");
        if(user!=null) {
            List<Books> books = bookRepository.findAll();
            map.addAttribute("books", books);
            return "bookdisplay";
        }
        return "redirect:/login";
    }
    @GetMapping("/category/{id}")
    public String booksCategories(@PathVariable int id,Model map,HttpSession session){
        Users user = (Users)session.getAttribute("user");
        if(user!=null) {
            List books = bookRepository.findByCategory(id);
            map.addAttribute("books", books);
            return "bookdisplay";
        }
        return "redirect:/login";
    }
    @GetMapping("/admincontact")
    public String contactUsView(HttpSession session){
        return "contactus";
    }
    @PostMapping("/contact")
    public String sendMail(@RequestParam("name") String name,
                           @RequestParam("email") String email,
                           @RequestParam("subject") String subject,
                           @RequestParam("message") String message, Model map){
        return storeServices.messageadmin(name,email,subject,message,map);
    }
    @PostMapping("/addtocart/{id}")
    public String addCart(@PathVariable int id,HttpSession session,Model map){
        Users user = (Users) session.getAttribute("user");
        if(user!=null){
            return storeServices.addToCart(id,session,map);
        }
        return "redirect:/login";
    }
    @GetMapping("/updateuserprofile")
    public String updateuser(HttpSession session,Model map){
        Users user = (Users) session.getAttribute("user");
        map.addAttribute("user",user);
        return "updateuserprofile";
    }
    @PostMapping("/updateUserProfile")
    public String updateUser(HttpSession session,Model map,UpdateUser updateUser){
        return storeServices.updateUserProfile(session,map,updateUser);
    }
    @PostMapping("/buy/{id}")
    public String buyBook(@PathVariable int id,HttpSession session,Model map){
        session.setAttribute("bookId",id);
        return storeServices.buy(id,session,map);
    }
    @PostMapping("/booking")
    public String confirmOrder(HttpSession session,Model map,UserAddress userAddress){
        int id = (int) session.getAttribute("bookId");
        return storeServices.bookingsConfirm(id,session,map,userAddress);
    }
    @GetMapping("/cart")
    public String cartDisplay(HttpSession session,Model map){
       return storeServices.cartView(session,map);
    }
    @GetMapping("/address/{id}")
    public String addressView(@PathVariable int id, HttpSession session,Model map){
        session.setAttribute("bookId",id);
        return storeServices.addressView(session,map);
    }
    @GetMapping("/ordersDisplay")
    public String displayOrders(HttpSession session, Model map){
        Users user = (Users) session.getAttribute("user");
        if(user!=null){
            String email = user.getEmail();
            List<Orders> orders = ordersRepository.findByUserId(email);
            map.addAttribute("orders", orders);
            return "orderdisplay";
        }
        return "redirect:/login";
    }
    @GetMapping("/about")
    public String aboutUsView(HttpSession session){
        return "/aboutus";
    }
    @GetMapping("/orderView/{id}")
    public String orders(@PathVariable int id, HttpSession session,Model map){
        Orders order = ordersRepository.findById(id);
        if(order!=null){
            Address address = addressReposiotry.findByEmail(order.getUserId());
            map.addAttribute("address",address);
            Books book = bookRepository.findById(order.getItemId());
            map.addAttribute("book",book);
            return "orderView";
        }
        return "orderdisplay";
    }
}
