package goit.gojava7.ryzhkov.controller;

import goit.gojava7.ryzhkov.model.Role;
import goit.gojava7.ryzhkov.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

@Controller
@RequestMapping("/roles")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("roleForm", new Role());
        model.addAttribute("rolesList", roleService.findAll());
        return "roles";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String info(@PathVariable("id") UUID id, Model model) {
        model.addAttribute("role", roleService.findById(id));
        return "roleInfo";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") UUID id) {
        roleService.removeById(id);
        return "redirect:/roles";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@ModelAttribute("role") Role role) {
        roleService.save(role);
        return "redirect:/roles";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") UUID id , Model model) {
        Role roleForm = roleService.findById(id);
        model.addAttribute("roleForm", roleForm);
        model.addAttribute("rolesList", roleService.findAll());
        return "roles";
    }


}
