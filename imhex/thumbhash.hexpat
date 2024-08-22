bitfield Header24 {
    dct_l_dc : 6;
    dct_p_dc : 6;
    dct_q_dc : 6;
    dct_l_scale : 5;
    has_alpha : 1;
};


bitfield Header16 {
    landscape_l : 3;
    dct_p_scale : 6;
    dct_q_scale : 6;
    is_landscape : 1;
};

struct Header {
    Header24 h24;
    Header16 h16;
};

Header header @ 0x00;


// ease of reading

float dct_l_dc out;
float dct_p_dc out;
float dct_q_dc out;
float dct_l_scale out;
bool has_alpha out;

u8 landscape_l out;
float dct_p_scale out;
float dct_q_scale out;

fn main() {
    dct_l_dc = header.h24.dct_l_dc / 63.f;
    dct_p_dc = (header.h24.dct_p_dc - 31.5f) / 31.5f;
    dct_q_dc = (header.h24.dct_q_dc - 31.5f) / 31.5f;
    dct_l_scale = header.h24.dct_l_scale / 31.f;
    has_alpha = header.h24.has_alpha;

    landscape_l = header.h16.landscape_l;
    dct_p_scale = header.h16.dct_p_scale/63.f;
    dct_q_scale = header.h16.dct_q_scale/63.f;
};
