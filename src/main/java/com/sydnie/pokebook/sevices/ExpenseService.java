package com.sydnie.pokebook.sevices;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;
import com.sydnie.pokebook.models.Expense;
import com.sydnie.pokebook.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
// Dependency Injections:

	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}

// Create:

	public Expense createExpense(Expense x) {
		return expenseRepository.save(x);
	}
	
// Retrieve:	
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}

	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if (optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
// Update:
	public Expense update(Expense e) {
		return expenseRepository.save(e);
	}

// Delete:	
	public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);
	}

}
