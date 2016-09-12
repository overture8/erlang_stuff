-module(blah).

%% API exports
-export([
  average/1, 
  sum_acc/2, 
  sum_positives/1, 
  sum_acc_between/3,
  sum_positives_between/2,
  create_list/1,
  print_range/1,
  fact/1
]).

%%====================================================================
%% API functions
%%====================================================================
average(List) -> sum(List) / len(List).

sum([]) -> 0;
sum([Head|Tail]) -> Head + sum(Tail).

len([]) -> 0;
len([_|Tail]) -> 1 + len(Tail).

sum_acc(0, Sum) -> Sum;
sum_acc(N, Sum) -> N + sum_acc(N - 1, Sum).

sum_acc_between(Lower, Upper, Sum) when Upper < Lower -> Sum;
sum_acc_between(Lower, Upper, Sum) when Upper >= Lower ->
  Upper + sum_acc_between(Lower, Upper - 1, Sum).

sum_positives(N) when N >= 0 ->
  sum_acc(N, 0).

sum_positives_between(N, M) ->
  sum_acc_between(N, M, 0).

list_acc(0, _) -> [];
list_acc(N, List) -> [N|list_acc(N - 1, List)].

create_list(N) ->
  lists:reverse(list_acc(N, [])).

print(Message) ->
  io:format("Number:~p~n",[Message]).

print_range(1) -> print(1);
print_range(N) ->
  print_range(N - 1),
  print(N).

fact(0) -> 1;
fact(N) -> N * fact(N - 1).




%%====================================================================
%% Internal functions
%%====================================================================
