package com.example.BookStore.Services;

import com.example.BookStore.Repository.*;
import com.example.BookStore.Request.*;
import com.example.BookStore.entities.*;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Random;

@Service
public class StoreServices {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private CategoriesRepository categoriesRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private OtpRepository otpRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private AddressReposiotry addressReposiotry;

    @Autowired
    private OrdersRepository ordersRepository;

    @Value("${spring.mail.username}")
    private String sender;

    private Base64.Encoder encoder= Base64.getEncoder();
    private Base64.Decoder decoder= Base64.getDecoder();



    public String adminLogin(AdminLoginRequest adminLoginRequest, HttpSession session, Model map){
        String email = adminLoginRequest.getEmail();
        Admin log = adminRepository.findByEmail(email);
        if(log!=null){
            String password = adminLoginRequest.getPassword();

            if(log.getPassword().equals(password)) {
                map.addAttribute("User logged in Successfully");
                session.setAttribute("email", email);
                session.setAttribute("admin", log);
                return "redirect:/admindashboard";
            }
        }
        map.addAttribute("error","credentials Do not match");
        return "redirect:/adminlogin";
    }
    public String addNewBook(Addbook addbook){
        Books book = new Books();
        Random random = new Random();
        book.setName(addbook.getName());
        book.setCategory(addbook.getCategory());
        book.setPrice(addbook.getPrice());
        MultipartFile[] files = addbook.getPhotos();
        List<String> imgNames = new ArrayList<>();

        if (files != null && files.length > 0) {
            String directory = "C:\\Users\\Ravi\\Desktop\\BookStore\\src\\main\\webapp\\view\\books";

            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    String profileName = random.nextInt() + file.getOriginalFilename();
                    String path = directory + "\\" + profileName;

                    try {
                        file.transferTo(new File(path));
                        imgNames.add(profileName);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        book.setPhotos(String.join(",", imgNames));
        bookRepository.save(book);
        return "redirect:/admindashboard";
    }

    public String resetPassword(ResetAdminPassword resetAdminPassword,HttpSession session,Model map) {
        String email = (String)session.getAttribute("email");
        Admin currentlog = adminRepository.findByEmail(email);
        if(currentlog!=null){
            if(currentlog.getPassword().equals(resetAdminPassword.getOldpassword())){
                currentlog.setPassword(resetAdminPassword.getNewpassword());
                map.addAttribute("success","Password updated succesfully");
                adminRepository.save(currentlog);
                return "profile";
            }else {
                map.addAttribute("errorMessage","invalid password");
                return "/updatepassword";
            }
        }
        return "/updatepassword";
    }

    public String addNewCategory(HttpSession session, AddCategory addCategory, Model map) {
        Admin admin = (Admin)session.getAttribute("admin");
        if(admin!=null){
            Categories categories = new Categories();
            categories.setId(addCategory.getId());
            categories.setName(addCategory.getName());
            categoriesRepository.save(categories);
            return "redirect:/categories";
        }
        return "/adminlogin";
    }
    public String updateCategory(int id,UpdateCategory updateCategory,Model map){
        Categories cat = categoriesRepository.findByid(id);
        if(cat!=null){
            cat.setName(updateCategory.getName());
            categoriesRepository.save(cat);
            return "redirect:/categories";
        }
        map.addAttribute("error","category not found");
        return "redirect:/categories";
    }

    public String updateAdminProfile(HttpSession session, Model map, UpdateAdmin updateAdmin) {
        Admin admin =(Admin) session.getAttribute("admin");
        if(admin!=null){
            admin.setName(updateAdmin.getName());
            Random random = new Random();
            MultipartFile file = updateAdmin.getProfile();
            if(!file.isEmpty()){
                String directory = "C:\\Users\\Ravi\\Desktop\\BookStore\\src\\main\\webapp\\view\\books";
                String profileName= random.nextInt()+ file.getOriginalFilename();
                String path = directory + "\\" + profileName;
                try{
                    file.transferTo(new File(path));
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                admin.setProfile(profileName);
            }
            adminRepository.save(admin);
            return "profile";
        }
        map.addAttribute("error","session expired or not found");
        return "adminlogin ";
    }

    public String updateBook(HttpSession session, UpdateBook updateBook,int id) {
        Books books = bookRepository.findById(id);
        if(books!=null){
            books.setPrice(updateBook.getPrice());
            books.setName(updateBook.getName());
            books.setCategory(updateBook.getCategory());
            bookRepository.save(books);
            return "redirect:/books";
        }
        return  "bookview";
    }
    public String addNewUser(HttpSession session, NewUser newUser, Model map) {
        String email = newUser.getEmail();
        Users user = userRepository.findByEmail(email);
        if (user == null) {
            user=new Users();
            user.setEmail(newUser.getEmail());
            session.setAttribute("email",email);
            user.setMobile(newUser.getMobile());
            user.setName(newUser.getName());
            Random random = new Random();
            int cartid=random.nextInt(999999);
            Cart cart = new Cart();
            cart.setId(cartid);
            cart.setEmail(newUser.getEmail());
            cartRepository.save(cart);
            user.setCartId(cartid);
            int addressId = random.nextInt(999999);
            user.setAddressId(addressId);
            Address address = new Address();
            address.setAddressId(addressId);
            address.setEmail(newUser.getEmail());
            addressReposiotry.save(address);
            if(isValidPassword(newUser.getPassword())){
//                String password = newUser.getPassword();
//                String encodedpassword = encoder.encodeToString(password.getBytes());
                user.setPassword(newUser.getPassword());
            }else{
                map.addAttribute("errorMessage","password doesn't meet specific critieria");

                return "/usersignup";
            }
            userRepository.save(user);
            session.setAttribute("authEmail", email);
            session.setAttribute("user",user);
            return "redirect:/emailverification";
        }
        map.addAttribute("errorMessage","Email already Exist");
        return "redirect:/signup";
    }

    public String userLogin(HttpSession session, Model map, UserLogin userLogin) {
        String email = userLogin.getEmail();
        Users user = userRepository.findByEmail(email);
        if(user!=null){
            String password = userLogin.getPassword();
            if(password.equals(user.getPassword())){
                session.setAttribute("user",user);
                session.setAttribute("userEmail",email);
                return "redirect:/index";
            }
            map.addAttribute("errorMessage","wrong password");
            return "/userlogin";
        }
        map.addAttribute("errorMessage", "user not found please signup!!");
        return "/userlogin";
    }

    public String resetUserPassword(ResetUserPassword resetUserPassword, Model map) throws IOException, MessagingException {
        String email = resetUserPassword.getEmail();
        Users user = userRepository.findByEmail(email);
        if(user!=null){
            String encodedEmail = encoder.encodeToString(email.getBytes());
            String resetLink="http://localhost:8080/confirmpassword/" + encodedEmail;
            String htmlContent = new String(Files.readAllBytes(Paths.get("C:\\Users\\CTS-Vansh Tyagi\\Desktop\\BookStore\\src\\main\\resources\\Email\\index.html")));
            htmlContent = htmlContent.replace("{{resetLink}}", resetLink);
            htmlContent = htmlContent.replace("{{encodedEmail}}", encodedEmail);
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper;
            mimeMessageHelper=new MimeMessageHelper(mimeMessage,true);
            mimeMessageHelper.setFrom(sender);
            mimeMessageHelper.setTo(email);
            mimeMessageHelper.setText(htmlContent,true);
            mimeMessageHelper.setSubject("Reset password");
            javaMailSender.send(mimeMessage);
            return "redirect:/login";
        }
        map.addAttribute("error-message","user not found");
        return "/resetpassword";
    }

    public String setUserPassword(String encodedEmail, String newpassword, Model map) {
        byte[] deMail= decoder.decode(encodedEmail);
        String decodedEmail = new String(deMail);
        Users user = userRepository.findByEmail(decodedEmail);
        if(user!=null){
            user.setPassword(newpassword);
            userRepository.save(user);
            map.addAttribute("success","password change successfully");
            return "redirect:/login";
        }
        map.addAttribute("errorMessage","corresponding user not found");
        return "#";
    }

    public void sendVerification(HttpSession session,OtpRequest request) {
        Otp otp = new Otp();
        Random random = new Random();
        int newotp = random.nextInt(999999);;
        String num = newotp+ "";
        int otpid= random.nextInt();
        otp.setId(otpid);
        session.setAttribute("otpId",otpid);
        otp.setOtp(num);
        String email = (String)session.getAttribute("authEmail");
        otp.setEmail(email);
        LocalDateTime localDateTime = LocalDateTime.now();
        otp.setDate(localDateTime);
        otpRepository.save(otp);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Verification email");
        message.setText("your Otp is :" + num);
        javaMailSender.send(message);
        System.out.println("mail sent");
    }

    public String otpValidation(HttpSession session,Model map ,OtpRequest request){
        String otp = request.getUserotp();
        int otpid = (int) session.getAttribute("otpId");
        Otp validOtp = otpRepository.findById(otpid);
        if(validOtp.getOtp().equals(otp)){
            Users user =userRepository.findByEmail(validOtp.getEmail());
            user.setEmailVerification(true);
            return "redirect:/index";
        }
        return "redirect:/emailverification";
    }

    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8) {
            return false;
        }
        boolean hasLower = false;
        boolean hasUpper = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;
        for (char c : password.toCharArray()) {
            if (Character.isLowerCase(c)) {
                hasLower = true;
            } else if (Character.isUpperCase(c)) {
                hasUpper = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            } else if ("@#$%^&+=!".indexOf(c) >= 0) {
                hasSpecialChar = true;
            }
        }
        return hasLower && hasUpper && hasDigit && hasSpecialChar;
    }

    public String addToCart(int id,HttpSession session,Model map) {
        Users user = (Users) session.getAttribute("user");
        int cartid = user.getCartId();
        Cart cart = cartRepository.findById(cartid);
        if(cart!=null) {
            Books book = bookRepository.findById(id);
            cart.setItemid(book.getId());
            cart.setEmail(user.getEmail());
            cartRepository.save(cart);
            map.addAttribute("book",book);
            return "/cart";
        }
        return "redirect:/shopbooks";
    }
    public String messageadmin(String name, String email, String subject, String message,Model map) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(sender);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);
        mailMessage.setFrom(sender);
        javaMailSender.send(mailMessage);
        map.addAttribute("success","message sent succesfully");
        return "/contactus";
    }

    public String updateUserProfile(HttpSession session, Model map, UpdateUser updateUser) {
        Users user = (Users) session.getAttribute("user");
        if(user!=null){
            user.setName(updateUser.getName());
            user.setMobile(updateUser.getMobile());
            user.setEmailVerification(updateUser.isEmailVerification());
            userRepository.save(user);
            return "updateuserprofile";
        }
        return "redirect:/login";
    }
    public String buy(int id, HttpSession session, Model map) {
        Books book= bookRepository.findById(id);
        Users user = (Users)session.getAttribute("user");
        Address address = addressReposiotry.findById(user.getAddressId());
        map.addAttribute("address",address);
        return "/address";
    }
    public String bookingsConfirm(int id,HttpSession session, Model map, UserAddress userAddress) {
        Users user =(Users) session.getAttribute("user");
        String email = user.getEmail();
        Cart cart = cartRepository.findByEmail(email);
        if(cart!=null){
            cart.setItemid(0);
        }
        Address address = addressReposiotry.findByEmail(email);
        address.setAddress(userAddress.getAddress());
        address.setCity(userAddress.getCity());
        address.setName(userAddress.getName());
        address.setCountry(userAddress.getCountry());
        address.setPincode(userAddress.getPincode());
        address.setState(userAddress.getState());
        addressReposiotry.save(address);
        Orders order = new Orders();
        Random random = new Random();
        order.setOrderId(random.nextInt(Integer.MAX_VALUE));
        order.setItemId(id);
        order.setPaymentMode("COD");
        order.setUserId(email);
        ordersRepository.save(order);
        return "redirect:/index";
    }

    public String cartView(HttpSession session, Model map) {
        Users user = (Users)session.getAttribute("user");
        if(user!=null){
            System.out.println("user found");
            Cart cart = cartRepository.findByEmail(user.getEmail());
            if(cart!=null){
                System.out.println("cart found");
                Books book = bookRepository.findById(cart.getItemid());
                if(book!=null) {
                    String price = book.getPrice();
                    map.addAttribute("price", price);
                    map.addAttribute("book", book);
                    return "/cart";
                }
                return "/cart";
            }
            return "emptycart";
        }
        return "rediect:/login";
    }

    public String addressView(HttpSession session, Model map) {
        Users user = (Users)session.getAttribute("user");
        Address address = addressReposiotry.findById(user.getAddressId());
        map.addAttribute("address",address);
        return "/address";
    }
}
