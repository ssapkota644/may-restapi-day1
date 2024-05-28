package com.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.dto.EmployeeDTO;
import com.service.EmployeeService;

import java.util.List;

@RestController
@RequestMapping("/employees")
public class EmployeeRestController {

    private final EmployeeService employeeService;

    public EmployeeRestController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping
    public List<EmployeeDTO> findAllEmployees() {
        return employeeService.findAllEmployeesSortedByName();
    }

    @PostMapping
    public String registerEmployee(@RequestBody EmployeeDTO employeeDTO) {
        employeeService.registerEmp(employeeDTO);
        return "Registration completed successfully";
    }

    @GetMapping("/{employeeId}") // Removed "/employees" from the annotation
    public ResponseEntity<EmployeeDTO> findEmployee(@PathVariable int employeeId) {
        EmployeeDTO employeeDTO = employeeService.findEmployeeById(employeeId);

        if (employeeDTO != null) {
            return ResponseEntity.ok(employeeDTO);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // Or return a custom message
        }
    }
    @DeleteMapping("/{employeeId}")
    public ResponseEntity<String> deleteEmployee(@PathVariable int employeeId) {
       employeeService.deleteEmployeeById(employeeId);
    
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Employee not found");
        }
    @PutMapping("/{employeeId}")
    public  String editEmployee(@PathVariable int employeeId, @RequestBody EmployeeDTO updatedEmployeeDTO) {
    	updatedEmployeeDTO.setEmployeeId(employeeId);
    	 employeeService.registerEmp(updatedEmployeeDTO);
       
            return "updated";
        }
    


}
