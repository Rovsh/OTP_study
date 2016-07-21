q1:start(1000).            
233168
done

q2:start(4000000). 
Result -> 2 plus 8 = 10 
Result -> 10 plus 34 = 44 
Result -> 44 plus 144 = 188 
Result -> 188 plus 610 = 798 
Result -> 798 plus 2584 = 3382 
Result -> 3382 plus 10946 = 14328 
Result -> 14328 plus 46368 = 60696 
Result -> 60696 plus 196418 = 257114 
Result -> 257114 plus 832040 = 1089154 
Result -> 1089154 plus 3524578 = 4613732 
Next value 5702887 more than MaxValue 4000000 
Result -> 4613732
done


q3:start(600851475143).
Prime factor -> 71
Next value to test -> 8462696833
Prime factor -> 839
Next value to test -> 10086647
Prime factor -> 1471
Next value to test -> 6857
Prime factor -> 6857
Next value to test -> 1
Max_prime_factor -> 6857
exit

q4:start(3).                                          
(913*993) = largest_palindrome -> 906609
max_palindrome = 906609
ok


q5:start(20).
Start: 9 Jul 2016 14:01:27.120000
number_found -> 232792560  can be divided to any [1..20]
Finish: 9 Jul 2016 14:01:36.384000
ok

q6:start(1000000).
Start:10 Jul 2016  4:20:15.230000
Max Chain quantity -> 524  started from 837799 
Finish:10 Jul 2016  4:20:21.993000


q8 (not gen server):
Server
(messenger@RAVSHAN)2> messenger:start_server().
true

Client 1
(c1@RAVSHAN)1> messenger:logon(aziz).
true
logged_on      
(c1@RAVSHAN)2> messenger:message_to_queue(a1,"aaaa").
ok
added
(c1@RAVSHAN)3> messenger:message_to_queue(a1,"aaaa2").
ok
added
(c1@RAVSHAN)4> messenger:message_to_queue(a1,"aaaa3").
ok
added

Client 2
(c2@RAVSHAN)1> messenger:logon(peter).
true
logged_on 
(c2@RAVSHAN)2> messenger:message_from_queue(a1).      
ok
{a1,"aaaa"}
(c2@RAVSHAN)3> messenger:message_from_queue(a1).
{a1,"aaaa2"}
ok
(c2@RAVSHAN)4> messenger:message_from_queue(a1).
{a1,"aaaa3"}
ok
(c2@RAVSHAN)5> messenger:message_from_queue(a1).
asked_query_not_found
ok

q8 (gen server):
(messenger@RAVSHAN)1> c(vshlr_4).
{ok,vshlr_4}
(messenger@RAVSHAN)2> vshlr_4:start().
{ok,<0.69.0>}
(messenger@RAVSHAN)3> vshlr_4:to_query(a1,"aaaa1").
Query is: {[{a1,"aaaa1"}],[]}
ok
(messenger@RAVSHAN)4> vshlr_4:to_query(a1,"aaaa2"). 
Query is: {[{a1,"aaaa2"}],[{a1,"aaaa1"}]}
ok
(messenger@RAVSHAN)5> vshlr_4:to_query(a1,"aaaa3"). 
Query is: {[{a1,"aaaa3"},{a1,"aaaa2"}],[{a1,"aaaa1"}]}
ok
(messenger@RAVSHAN)6> vshlr_4:get_query(a1).       
Group: a1, Message: "aaaa1"
Remain query is: {[{a1,"aaaa3"}],[{a1,"aaaa2"}]}
ok
(messenger@RAVSHAN)7> vshlr_4:get_query(a1).
Group: a1, Message: "aaaa2"
Remain query is: {[],[{a1,"aaaa3"}]}
ok
(messenger@RAVSHAN)8> vshlr_4:get_query(a1).
Group: a1, Message: "aaaa3"
Remain query is: {[],[]}
ok
(messenger@RAVSHAN)9> vshlr_4:stop().              
ok
(messenger@RAVSHAN)10> 
