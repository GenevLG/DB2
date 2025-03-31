using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wfa_scolaireDepart.Models
{
    public partial class ListerResultatEtudiantResult
    {
        public string no_da { get; set; }
        [StringLength(100)]
        public string nom { get; set; }
        [StringLength(100)]
        public string prenom { get; set; }
        [Column("note", TypeName = "decimal(5,2)")]
        public decimal? note { get; set; }
        [StringLength(100)]
        public string Nom { get; set; }
        public string no_session { get; set; }
    }
}
