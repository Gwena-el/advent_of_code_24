import std::io;
import std::collections::list;
import std::sort;
import std::math;

const String FILENAME = "input.txt";

fn void main() {
    io::printn("AOC2 with c3!");

    String! buffer = (String)io::file::load_temp(FILENAME);
    if (catch err = buffer) {
	io::printfn("Could not load file %s", FILENAME);
	return;
    }
    buffer = buffer[:^1];

    String[] levels = buffer.tsplit("\n");
    
    uint result;
    foreach(i, level : levels) {
	String[] level_report = level.tsplit(" ");
	List(<int>) level_list;
	level_list.temp_init();
	
        foreach(c : level_report) level_list.push(c.to_uint())!!;
	
	if (is_sorted(level_list)) {
	    // check distance between reports.
	    int min = 1;
	    int max = 3;
	    int current = level_list[0];
	    level_list.pop_first()!!;

	    bool success = true;
	    foreach (n : level_list) { 
		int distance = math::abs(current - n);
		if (distance < min || distance > max) {
		    success = false;
		    break;
		}
		current = n;
	    }
	    if (success) result++;
	}
    }

    io::printfn("result = %d", result);
}
