import std::io;
import std::collections::list;
import std::sort;

const String FILENAME = "input.txt";

fn void main() {
    io::printn("AOC1 with c3!");

    String! buffer = (String)io::file::load_new(FILENAME);
    if (catch err = buffer) {
	io::printfn("Couldn't load file %s", FILENAME);
	return;
    }
    defer(buffer.free());

    List(<uint>) l1;
    List(<uint>) l2;
    defer(l1.free());
    defer(l2.free());
    
    String[] lines = buffer.tsplit("\n");
    
    foreach(line : lines) {
	if (line) {
	    String tstring = (String)line;
	    int separation = (int)tstring.index_of_char(' ')!!;
	    l1.push(tstring[0:separation].to_int()!!);
	    l2.push(tstring[separation..].to_int()!!);
	}
    }

    int result;
    foreach(first : l1) {
	uint count;
	foreach(second : l2) {
	    if (first == second) {
		count++;
	    }
	}
	result += (first * count);
    }

    io::printfn("Result = %d", result);
}
