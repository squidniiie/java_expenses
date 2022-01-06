package com.sydnie.pokebook.controllers;

import java.util.List;

import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sydnie.pokebook.models.Expense;
import com.sydnie.pokebook.sevices.ExpenseService;

@Controller
public class ExpenseController {
	private final ExpenseService expenseService;
	
	public ExpenseController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}

//Retrieve one:
	@RequestMapping("/expenses/{id}")
	public String retrieveOne(@PathVariable("id") Long id, Model model) {
		Expense oneExpense = expenseService.findExpense(id);
		model.addAttribute("oneExpense", oneExpense);
		return "show.jsp";
	}
	

//Retrieve all page:
	@RequestMapping("/expenses")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenseList", expenses);
		return "expenses.jsp";
	}

	@RequestMapping(value = "/expenses", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenseList", expenses);
			return "expenses.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}

//Update:

	@RequestMapping("/expenses/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}

	@RequestMapping(value="/expenses/update/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			expenseService.update(expense);
//			expenseService.updateExpense(expense, id);
			return "redirect:/expenses";
		}

	}
//Delete:
	@RequestMapping(value="/expenses/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}

}
