package goit.gojava7.ryzhkov.controller;

import goit.gojava7.ryzhkov.model.Manufacturer;
import goit.gojava7.ryzhkov.model.Product;
import goit.gojava7.ryzhkov.service.ManufacturerService;
import goit.gojava7.ryzhkov.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.beans.PropertyEditorSupport;
import java.util.UUID;

@Controller
@RequestMapping(value = "/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ManufacturerService manufacturerService;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Manufacturer.class, "manufacturer", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                try {
                    setValue(manufacturerService.findById(UUID.fromString(text)));
                } catch (IllegalArgumentException e) {
                    setValue(null);
                }
            }
        });
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("productForm", new Product());
        model.addAttribute("manufacturersList", manufacturerService.findAll());
        model.addAttribute("productsList", productService.findAll());
        return "products";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String info(@PathVariable("id") UUID id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "productInfo";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable("id") UUID id) {
        productService.removeById(id);
        return "redirect:/products";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@ModelAttribute("product") Product product) {
        productService.save(product);
        return "redirect:/products";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") UUID id, Model model) {
        Product productForm = productService.findById(id);
        model.addAttribute("productForm", productForm);
        model.addAttribute("manufacturersList", manufacturerService.findAll());
        model.addAttribute("productsList", productService.findAll());
        return "products";
    }

}
