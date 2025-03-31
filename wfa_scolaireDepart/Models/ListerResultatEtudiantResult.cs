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
        public string NoDa { get; set; }
        [StringLength(100)]
        public string Nom { get; set; }
        [StringLength(100)]
        public string Prenom { get; set; }
        [Column("note", TypeName = "decimal(5,2)")]
        public decimal? Note { get; set; }
        [StringLength(100)]
        public string NomCours { get; set; }
        public string NoSession { get; set; }
    }
}
