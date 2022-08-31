<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absens extends Model
{
    use HasFactory;
    protected $table = 'absens';
    protected $fillable = ['status', 'siswa_id', 'jadwal_id', 'tanggal'];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class);
    }


    public function getCreatedAtAttribute($date)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('Y-m-d');
    }
}
