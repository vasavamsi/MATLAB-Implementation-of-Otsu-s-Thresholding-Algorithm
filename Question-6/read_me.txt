>> This is read me document for the Question No. 6 (Arithmetic Coding) in DIP Assignment-2

==> Code initiation:-

1> Run the test_script.
2> Here as per the requirement of problem statement, user can run the code for both the Images or on the manual probabilty table designed by him/her.
3> Other part of the code has to be commented out.

==> Functions defined for this problem statement:-

1> rastor( ) - To get the intensity values in the Image matrix as a single sequence to process
	input argument - Input Image(I)
	output argument - Single array sequence(y)

2> histogram_19210112( ) - To get the probability table from the image
	input argument - Input Image(I)
	output argument - probability table(y)

3> arith_code( ) - Main function
	input argument - Symbol table(input), No. of symbols to be coded together(N), message to be transferred(msg), 
			 flag to denote the answer to be in binary or in ddecimal system(flag)
	output argument - column vector of the encoded messages(y).

4> bin_19210112( ) - To get the binary output of the encoded message with minimal bits
	input argument - initial value for the range(ini_val), final value for the range(fin_val)
	output argument- binary output of the message with minimal no. of bits(y)

==> Comments:-

>> To reduce the run time user can resize the image using resize().
>> In binary output of the code, the 0's after the last 1 should be neglected, as they are result of using "format long", without which the bits were lost to natural
   tendency of matlab to truncate(or round off) the fractions.
>> For the input of an Image, no need to enter the input for "msg".