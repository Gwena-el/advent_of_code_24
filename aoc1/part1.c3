import std::io;
import std::collections::list;
import std::sort;

const String FILENAME = "input.txt";

fn int compare(int a, int b) {
    switch {
	case a < b: return -1;
	case a > b: return  1;
    }
    return  0;
}

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

    quicksort(l1, &compare);
    quicksort(l2, &compare);

    int result;
    for (int i = 0; i < l1.len(); ++i) {
	if (l1[i] > l2[i]) { result += l1[i] - l2[i]; }
	else { result += l2[i] - l1[i]; }
    }

    io::printfn("Result = %d", result);
    
}
