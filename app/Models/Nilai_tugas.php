<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Nilai_tugas extends Model
{
    use HasFactory;
    protected $table = 'nilai_tugas';
    protected $fillable = [
        'tugas_id',
        'nilai',
        'komentar_guru',
    ];

    public function getCreatedAtAttribute($date)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('Y-m-d');
    }
}
