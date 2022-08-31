<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\Absen;
use App\Models\Absens;
use App\Models\Jadwal;
use App\Models\Materi;
use App\Models\Ruangan;
use App\Models\Siswa;
use App\Models\Tugas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GuruController extends Controller
{
    public function index()
    {
        return view('frontend.guru.index');
    }

    public function jadwalMengajar()
    {
        $jadwals = Jadwal::with('mata_pelajaran', 'hari', 'ruangan', 'guru')->where('guru_id', Auth::guard('guru')->user()->id)->get();

        return view('frontend.guru.jadwal', [
            'jadwals' => $jadwals,
        ]);
    }

    // public function semua_tugas(Request $request)
    // {
    //     $semua_tugas = Tugas::with('jadwal')->where('jadwal_id', $request->jadwal_id)->get();
    //     return view('frontend.guru.semua_tugas', compact('semua_tugas'));
    // }

    public function tugas(Request $request)
    {

        if ($request->file('file_or_link')) {
            //simpan foto produk yang di upload ke direkteri public/storage/file_or_linkproduct
            $file = $request->file('file_or_link')->store('images', 'public');

            $tugas = [
                'judul' => $request->judul,
                'type' => $request->type,
                'description' => $request->description,
                'pengumpulan' => $request->pengumpulan,
                'file_or_link' => $file,
                'jadwal_id' => $request->jadwal_id,
                'tanggal' => $request->tanggal
            ];

            Tugas::create($tugas);
            return back()->with('success', 'tugas berhasil di buat');
        }

        $tugas = [
            'judul' => $request->judul,
            'type' => $request->type,
            'description' => $request->description,
            'pengumpulan' => $request->pengumpulan,
            'file_or_link' => $request->file_or_link,
            'jadwal_id' => $request->jadwal_id,
            'tanggal' => $request->tanggal
        ];

        if ($tugas) {
            Tugas::create($tugas);
            return back()->with('success', 'tugas berhasil di buat');
        }

        return back()->with('error', 'tugas gagal di buat');
    }

    public function materi(Request $request)
    { {

            if ($request->file('file_or_link')) {
                //simpan foto produk yang di upload ke direkteri public/storage/file_or_linkproduct
                $file = $request->file('file_or_link')->store('images', 'public');

                $materi = [
                    'judul' => $request->judul,
                    'type' => $request->type,
                    'description' => $request->description,
                    'pengumpulan' => $request->pengumpulan,
                    'file_or_link' => $file,
                    'jadwal_id' => $request->jadwal_id,
                    'tanggal' => $request->tanggal
                ];

                Materi::create($materi);
                return back()->with('success', 'Materi berhasil di buat');
            }

            $materi = [
                'judul' => $request->judul,
                'type' => $request->type,
                'description' => $request->description,
                'pengumpulan' => $request->pengumpulan,
                'file_or_link' => $request->file_or_link,
                'jadwal_id' => $request->jadwal_id,
                'tanggal' => $request->tanggal
            ];

            if ($materi) {
                Materi::create($materi);
                return back()->with('success', 'Materi berhasil di buat');
            }

            return back()->with('error', 'Materi gagal di buat');
        }
    }

    public function create($id)
    {
        $jadwalId = decrypt($id);
        $jadwal = Jadwal::where('id', $jadwalId)
            ->where('guru_id', Auth::guard('guru')->user()->id)
            ->first();

        return view('frontend.guru.meteri', compact('jadwal'));
    }

    // public function store(Request $request)
    // {
    //     $materi = $request->all();

    //     if ($request->tipe == 'pdf') {
    //         $fileName = time() . '.' . $request->file('file_or_link')->extension();
    //         $materi['file_or_link'] = $request->file('file_or_link')->storeAs("materials", $fileName);
    //     }

    //     Auth::guard('guru')->user()->materi()->create($materi);

    //     return redirect(route('kelas.materi', $materi['jadwal']))->with('success', 'Berhasil membuat materi');
    // }

    public function masuk(Request $request, $id)
    {
        //parameter $jadwalId adalah id dari jadwal yang sudah di encrypt
        //dan kode dibawah untuk mencari jadwal dari param $jadwalId sekalian di decrypt var $jadwalId nya
        $jadwal = Jadwal::with(['ruangan'], ['guru'], ['mata_pelajaran'])->where('id', decrypt($id))->first();
        // $ruangan = Ruangan::with('siswa')->where('siswa_id', $jadwal->ruangan->siswa->id)->get();
        $ruangan = Ruangan::with('siswa')->where('kelas_id', $jadwal->ruangan->kelas_id)->where('jurusan_id', $jadwal->ruangan->jurusan_id)->get();
        $count = Ruangan::with('siswa')->where('kelas_id', $jadwal->ruangan->kelas_id)->where('jurusan_id', $jadwal->ruangan->jurusan_id)->count('siswa_id');

     

        // Jika waktu pada jadwal sesuai maka jalankan code dibawah 
        if (\Carbon\Carbon::now('Asia/Jakarta')->format('H:i') >= $jadwal->jam_masuk && \Carbon\Carbon::now('Asia/Jakarta')->format('H:i') <= $jadwal->jam_keluar) {

            // Code dibawah untuk menampilkan seluruh mahasiswa yang berada di kelas yang sama dan dijadwal yang sama
            // Beserta menampilkan  absensi hari ini


            // $mahasiswa = Jadwal::with(['ruangan'], ['guru'], ['mata_pelajaran'])->where('ruangan_id', $ruangan->id)->where()->where('id', decrypt($id))->first();
            // $absen = Absen::where('guru_id', Auth::guard('guru')->user()->id)->where('jadwal_id', $jadwal->id)->where('siswa_id', $jadwal->ruangan->siswa->id)->get();
            // $siswa = Ruangan::with('siswa')->get();
            $hariini = \Carbon\Carbon::now()->format('Y-m-d');
            $absens = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->get();
            $absen_izin_total = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'izin')->count('siswa_id');
            $absen_alpha_total = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'alpa')->count('siswa_id');
            $absen_sakit_total = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'sakit')->count('siswa_id');



            $counthariini_sakit = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'sakit')->where('created_at', $hariini)->count('siswa_id');
            $counthariini_alpa = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'alpa')->where('created_at', $hariini)->count('siswa_id');
            $counthariini_izin = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->where('status', 'izin')->where('created_at', $hariini)->count('siswa_id');


            $tugas_hari_ini = Tugas::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->count();
            $tugas_hari_ini_tampil = Tugas::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->get();

            $semua_tugas = Tugas::with('jadwal')->where('jadwal_id', $jadwal->id)->count();
            $semua_tugas_tampil = Tugas::with('jadwal')->where('jadwal_id', $jadwal->id)->get();

            $semua_materi_tampil = Materi::with('jadwal')->where('jadwal_id', $jadwal->id)->get();


            $materi_hari_ini_tampil = Materi::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->get();
            $materi_hari_ini = Materi::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->count();

            $hadir = Absens::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->get();

            $pp = Absens::with('jadwal')->where('jadwal_id', $jadwal->id)->where('tanggal', $hariini)->count('siswa_id');
            $total_hadir_siswa = $count - $pp;

            // $mahasiswaHadir = $absen->where('parent',  null)->count();
            // $mahasiswaTidakHadir = $absen->where('parent', '==', null)->count();

            // Code dibawah untuk menampilkan data absen yang telah dibuat oleh dosen untuk hari ini
            // dan akan digunakan untuk simpan rekap absen
            // $absen = Absen::where('guru_id', Auth::guard('guru')->user()->id)
            //     ->where('jadwal_id', $jadwal->id)
            //     ->whereDate('created_at', now())
            //     ->first();

            $check = Absens::with('siswa', 'jadwal')->where('jadwal_id', $jadwal->id)->count('siswa_id');

            return view('frontend.guru.kelas', compact(
                'ruangan',
                'jadwal',
                'absens',
                'count',
                'absen_alpha_total',
                'absen_izin_total',
                'absen_sakit_total',
                'counthariini_sakit',
                'counthariini_alpa',
                'counthariini_izin',
                'hariini',
                'tugas_hari_ini',
                'semua_tugas',
                'hadir',
                'total_hadir_siswa',
                'pp',
                'tugas_hari_ini_tampil',
                'materi_hari_ini',
                'materi_hari_ini_tampil',
                'semua_tugas_tampil',
                'semua_materi_tampil',
                'check',
                // 'siswa_hadir'
                // 'mahasiswaHadir',
                // 'mahasiswaTidakHadir'
            ));
        }

        // Jika waktu pada jadwal tidak sesuai return back
        return back();
    }

    public function storeAbsen(Request $request)
    {
        $hariini = \Carbon\Carbon::now()->format('Y-m-d');

        // $check = Absens::with('siswa', 'jadwal')->where('jadwal_id', $request->jadwal_id)->where('tanggal', $hariini)->count('siswa_id');

        $check = Absens::with('siswa', 'jadwal')->where('jadwal_id', $request->jadwal_id)->where('siswa_id', $request->siswa_id)->where('tanggal', $hariini)->count('siswa_id');
        if ($check < 1) {
            $absens = [
                'status' => $request->status,
                'siswa_id' => $request->siswa_id,
                'jadwal_id' => $request->jadwal_id,
                'tanggal' => $request->tanggal,
            ];
            Absens::create($absens);
            return back()->with('success', 'Berhasil menyimpan data absen');
        }

        return back()->with('error', 'Siswa sudah di absen izin/sakit/alpa');
    }




    // public function create_absensi($id)
    // {
    //     $jadwal = Jadwal::with('hari')->findOrFail(decrypt($id));
    //     $kelasActive = Jadwal::with('guru')->where('guru_id', Auth::guard('guru')->user()->id)->where('hari_id', 5)->get();
    //     $absen = Absen::where('guru_id', Auth::guard('guru')->user()->id)
    //         ->where('jadwal_id', $jadwal->id)
    //         ->whereDate('created_at', now())
    //         ->first();
    //     return view('frontend.guru.absensi-create', compact('kelasActive', 'jadwal', 'absen'));
    // }

    // public function store_absensi(Request $request)
    // {
    //     $jadwal_id = decrypt(request('jadwal'));

    //     request()->validate([
    //         'pertemuan' => 'required'
    //     ]);

    //     $absen = Absen::create([
    //         'jadwal_id' => $jadwal_id,
    //         'pertemuan' => request('pertemuan'),
    //         'rangkuman' => request('rangkuman'),
    //         'berita_acara' => request('berita_acara')
    //     ]);

    //     $mahasiswas = Siswa::where('ruangan_id', request('kelas'))->get();

    //     foreach ($mahasiswas as $mahasiswa) {
    //         Absen::create([
    //             'jadwal_id' => $jadwal_id,
    //             'parent' => $absen->id,
    //             'siswa_id' => $mahasiswa->id,
    //             'pertemuan' => $absen->pertemuan,
    //         ]);
    //     }

    //     session()->flash('success', 'Berhasil membuat absen hari ini');
    //     return redirect(route('kelas-masuk', request('jadwal')));
    // }
}