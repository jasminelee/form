import json
from pprint import pprint
import sys

# with open(sys.argv[-1]) as data_file:
# 	data = json.load(data_file) #.load turns the json into a list of dicts


#print data[1]['choices'][0]['choice']
#print data[1]['choices']
# print data[2]['choices'][0]
# print len(data[2]['choices'][1])

def recursive_CLI(d):
	for each in d:
		if len(each) == 1 and ((not each.has_key('choices')) or len(each['choices'])==0): #choices list is empty or missing -> free response
			user_input = raw_input(each['question'] + "\n>>> ")
			store_responses(each['question'], user_input)
		elif len(each) >= 2 and each.has_key('choices'):
			while True:
				choices = list_choices(each['choices'])
				user_input = raw_input(each['question'] + "\nYour choices are: " + choices + "\n>>> ")
				if user_input in choices.split():
					store_responses(each['question'], user_input)
					for choice in each['choices']:
						if choice['choice'] == user_input and choice.has_key('follow-ups'):
							recursive_CLI(choice['follow-ups'])
					break
				else:
					sys.stdout.write('Please respond with the given choices. Your response is case sensitive.\n')
	
def store_responses(q, a):
	new_list = []
	new_list.append(q)
	new_list.append(a)
	result.append(new_list)

def list_choices(choices):
	temp = map(lambda x: x['choice'], choices)
	return ' '.join(temp)

json_data = open(sys.argv[-1]).read()
data = json.loads(json_data)

result = []
user_name = raw_input("What's your name?" + "\n>>> ")
result.append(user_name)
#result.append([[user_name]])

recursive_CLI(data)
g = open('responses.json', 'a')
with g as outfile:
	json.dump(result, outfile, indent=4)
	outfile.write(',' + "\n")

#parsed_input = json.load(sys.argv[-1])

# def recur(dictionary):
# 	print type(dictionary), dictionary
# 	for key, v in dictionary:
# 		if key == "question":
# 			user_input = raw_input(v)
# 			result.write(user_input)
# 		elif isinstance(v, dictionary):
# 			for val in recur(v):
# 				raw_input(val)

# for value in data:
# 	recur(value)

# def recurse(value):
# 	if hasattr(value, '__iter__'):
# 		for item in value:
# 			recurse(item)
# 		return
# 	result.write(raw_input(value))
# for value in data:
# 	recurse(value)

# for question in data:
# 	input_var = raw_input(question)
# 	result.write(input_var)
#input_var = raw_input(json option)
#write input_var into resulting file 

#pprint(data)