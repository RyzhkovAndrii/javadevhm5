package goit.gojava7.ryzhkov.controller;

import goit.gojava7.ryzhkov.model.Manufacturer;
import goit.gojava7.ryzhkov.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.UUID;

@Controller
@RequestMapping("/manufacturers")
public class ManufacturerController {

    @Autowired
    private ManufacturerService manufacturerService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("manufacturerForm", new Manufacturer());
        model.addAttribute("manufacturersList", manufacturerService.findAll());
        return "manufacturers";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String info(@PathVariable("id") UUID id, Model model) {
        model.addAttribute("manufacturer", manufacturerService.findById(id));
        return "manufacturerInfo";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") UUID id) {
        manufacturerService.removeById(id);
        return "redirect:/manufacturers";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@ModelAttribute("manufacturer") Manufacturer manufacturer) {
        manufacturerService.save(manufacturer);
        return "redirect:/manufacturers";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") UUID id , Model model) {
        Manufacturer manufacturerForm = manufacturerService.findById(id);
        model.addAttribute("manufacturerForm", manufacturerForm);
        model.addAttribute("manufacturersList", manufacturerService.findAll());
        return "manufacturers";
    }

}
