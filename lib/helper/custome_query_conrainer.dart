class CustomQuery {
  static String selectDataGroubByType = ''' SELECT
                            income_expense_data.id dataID,
                            income_expense_data.description,
                            income_expense_type.id typeID,
                            income_expense_type.typeName,
                            sum(amount) totAmount
                          FROM
	                          income_expense_data
                          INNER JOIN 
                              income_expense_type 
                            on 
                              income_expense_type.id = income_expense_data.incomeExpenseTypeId
                          GROUP BY
	                            income_expense_data.incomeExpenseTypeId''';
}
