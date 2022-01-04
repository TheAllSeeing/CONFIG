#!/bin/python3

import subprocess as sp

def git_diff(id1, id2):
  comm = 'git diff -U0 ' + id1 + ' ' + id2
  output = str(sp.check_output(comm , shell=True))[2:-3]   
  lines = output.split('\\n')
  return lines

'''
Return a list of 'diffs' (each diff is represented by a list); 
- The first item of a diff is the name of the file it's in
- The second item of a diff is the line changed in git diff format (e.g ' -202,3 +202,3 ')
- The third item onwards is the changes themselves in git diff format (removals start with -, additions with +).
'''
def get_diffs(raw):
  changes = []
  for index, line in enumerate(raw): 
    if line.startswith('@@') and not (raw[index - 1].startswith('+++') or raw[index - 1].startswith('---')) or line.startswith('diff') and index != 0: 
      new_change = [current_file] + raw[current_start:index] 
      new_change[1] = new_change[1].split('@@')[1] 
      changes.append(new_change) 
    if line.startswith('@@'): 
      current_start = index 
    if line.startswith('diff'): 
      current_file = line.split('/')[-1]
  return changes
 
def diff_query(predicate, id1, id2):
  raw  = git_diff(id1, id2)
  changes = get_diffs(raw)
  return list(filter(predicate, changes))


def print_query(predicate, id1, id2):
	query = diff_query(predicate, id1, id2) 
	for diff in query: 
		print('\n\n')
		for line in diff:
			print(line)