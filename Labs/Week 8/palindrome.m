function palindrome(text)
    
     text = lower(text);
     
     if text == fliplr(text)
        fprintf('%s is a Palindrome\n', text); 
     else
         fprintf('%s is not a Palindrome\n', text);
     end     
end