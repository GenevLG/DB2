using Microsoft.EntityFrameworkCore;

//CHANGER LE NAMESPACE --> MyAdds pour Models
namespace wfa_scolaireDepart.Models
{
    //SUUPRIMER LA internal class MyAdds
    public partial class Glg_bdContext : DbContext
    {
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<VueListerResultat>(entity =>
            {
                entity.HasKey(i => new { i.NoDa, i.NoOffreCours }); //Les deux clé primaire de la View
                entity.UpdateUsingStoredProcedure("ModifierNoteEtudiant", sp =>
                {
                    //ORDRE EST IMPORTANTE ** DANS LA MÊME QUE DANS LE SQL
                    sp.HasOriginalValueParameter(i => i.NoDa); //Clé Primaire
                    sp.HasOriginalValueParameter(i => i.NoOffreCours); //Clé Primaire
                    sp.HasParameter(i => i.Note);
                    sp.HasParameter(i => i.Nom);
                    sp.HasParameter(i => i.Prenom);
                }
                );
                entity.ToTable("TblInscription", i => i.ExcludeFromMigrations());
            }
            );
        }
    }
}
