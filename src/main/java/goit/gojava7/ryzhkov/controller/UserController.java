package goit.gojava7.ryzhkov.controller;

import goit.gojava7.ryzhkov.model.User;
import goit.gojava7.ryzhkov.service.RoleService;
import goit.gojava7.ryzhkov.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Set.class, "roles", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {
                UUID id = UUID.fromString((String) element);
                return roleService.findById(id);
            }
        });
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("userForm", new User());
        model.addAttribute("rolesList", roleService.findAll());
        model.addAttribute("usersList", userService.findAll());
        return "users";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String info(@PathVariable("id") UUID id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "userInfo";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") UUID id) {
        userService.removeById(id);
        return "redirect:/users";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@ModelAttribute("user") User user) {
        userService.save(user);
        return "redirect:/users";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") UUID id, Model model) {
        User userForm = userService.findById(id);
        model.addAttribute("userForm", userForm);
        model.addAttribute("rolesList", roleService.findAll());
        model.addAttribute("usersList", userService.findAll());
        return "users";
    }

}
