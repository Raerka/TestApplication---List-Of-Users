package com.springapp.mvc.controller;

import com.springapp.mvc.model.User;
import com.springapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
public class UserController {

    private UserService userService;

    @Autowired                                                     //Автоматическое связывание
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "userList")
    public ModelAndView getAllUsers(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("userList");

        List<User> users = userService.getAllUsers();

        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(10);

        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        modelAndView.addObject("page", page);

        if (page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());

        }else if (page <= pagedListHolder.getPageCount()){
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        modelAndView.addObject("user", new User());
        modelAndView.addObject("AllUsers", users);

        return modelAndView;
    }

    // Отдельная страница для просмотра списка после поиска по имени

    @RequestMapping(value = "findingUsers")
    public String findingUsers(@ModelAttribute(value = "name") String name, Model model) {
        if (name != null) {
            model.addAttribute("findingUser", new User());
            model.addAttribute("FindingUsers", userService.findUsersByName(name));
        }
        return "findingUsers";
    }

    @RequestMapping(value = "/userList/add")
    public String addUser(@ModelAttribute("user") User user) {
        if (user.getId() != 0) {
            userService.updateUser(user);
        } else {
            userService.addUser(user);
        }
        return "redirect:/userList";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        userService.removeUser(id);

        return "redirect:/userList";
    }

    //Отдельная страница для редактирования

    @RequestMapping(value = "/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("AllUsers", userService.getAllUsers());

        return "userList";
    }

    // Отдельная страница для просматривания данных пользователя

    @RequestMapping("userData/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userService.getUserById(id));

        return "userData";
    }
}











