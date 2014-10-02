#!/usr/bin/env python
# -*- coding: utf-8-

import sys

"""
Instructions:
PUSH, SOMA, SUB, MULT, DIV
"""

stack = []

def imprimir():
	print 'Output:', stack.pop()

def push(info):
	stack.append(float(info))

def sum():
	stack.append(stack.pop() + stack.pop())

def sub():
	arg2 = stack.pop()
	stack.append(stack.pop() - arg2)

def mult():
	stack.append(stack.pop() * stack.pop())

def div():
	arg2 = stack.pop()
	stack.append(stack.pop() / arg2)

if len(sys.argv) < 2:
	print "Nome do arquivo não informado."
	sys.exit(1)

try:
	arq = open(sys.argv[1], 'r')
except:
	print "Não foi possível abrir o arquivo."
	sys.exit(1)

result = 0.

line = arq.readline()
while (line):
	try:
		command, arg = line[:-1].split(" ")
	except:
		command = line[:-1].split(" ")[0]

	command = 'imprimir' if (command.lower() == 'print') else command.lower()

	command = eval(command)
	try:
		command(arg)
	except:
		command()

	line = arq.readline()

arq.close()