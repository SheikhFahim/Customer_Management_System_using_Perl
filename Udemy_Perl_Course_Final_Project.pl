sub building_list
{
	@name_list=();
	$filename='list.txt';
	open(FILE,"<",$filename);
	while ($name=<FILE>)
	{
		push(@name_list,$name);
	}
	close(FILE);
}

#Creating the Options Menu UI
sub user_options
{
	#Displaying User the 4 Options
	print("\n1. Search for customer\n");
	print("\n2. Add a customer\n");
	print("\n3. Get all customer names\n");
	print("\n4. Quit the Customer Management System\n");
	
	#Printing the Option selected By the User
	print("\nSelect an Option to continue: ");
	chomp($selected_option=<STDIN>);
	
	return $selected_option;
}

sub get_customers
{
	print("\nCustomers: \n\n");
	
	#Count counts the number of active customers for serial purpose
	my $count=0;
	
	#Prints out the list customers with serial number
	foreach $name_of_cus (@name_list)
	{
		$count += 1;
		print("$count. $name_of_cus");
	}
	print("\n");
	
}

sub adding_new_cus
{
	#Printing prompt for user to input a name
	print("\nEnter namer of a new Customer: ");
	$new_cus=<STDIN>;
	
	#Appending the new customer to the txt File
	$filename='list.txt';
	open(FILE,">>",$filename) or die;
	print FILE "$new_cus";
	close(FILE);
	print("\nNew Customer Added Successfully\n");
}


sub search_for_cus
{
	print("\nEnter Customer name you want to search: ");
	$name_of_search_cus=<STDIN>;
	foreach $name (@name_list)
	{
		if (lc($name_of_search_cus) eq lc($name))
		{
			print("\n$name was found in the customer list!!!!\n");
			return;
		}
	}
	print("\nSorry the input name was not found in the list!!!\n");
	
}

##############################################
#
#Starting of the customer Management Application
#
##############################################

print("\n\n\t Welcome to Sheikh Fahim's Internation Hotel Guest Lists \n\n");
print("\t\tDesigned By: Sheikh Fahim Uz Zaman\n\n");
&building_list();
$selected_options=&user_options();

while ($selected_options !=4)
{
	if($selected_options==1)
	{
		&search_for_cus();
		$selected_options=&user_options();
	}
	elsif($selected_options==2)
	{
		&adding_new_cus();
		&building_list();
		$selected_options=&user_options();
	}
	elsif($selected_options==3)
	{
		&get_customers();
		$selected_options=&user_options();
	}
	else
	{
		print("\n\nPlease Enter a Vallid Option to continue\n\n");
		$selected_options=&user_options();
	}
	
}
