#.KEEP_STATE:
#.SILENT
EXEC	= pole
OFILES	= pole.o

CC	= cc

LIBS	=	-lm 
INCLUDE = 	-I/usr/include


$(EXEC)	: $(OFILES)
	echo "linking $<"
	$(CC) -o $(EXEC) $(OFILES)  $(LIBS) $(INCLUDE)


pole.o : pole.c  pole.h
	$(CC) -c pole.c 

pole.c:  pole.h


# Clean up after making. 
clean:
	echo "removing" *.o
	$(RM) *.o
	if [ -d /tmp/$(USER)tmp ]; \
	 then echo "clearing /tmp/$(USER)tmp"; $(MAKE) tclean; fi


	echo -n "make finished at "; date




