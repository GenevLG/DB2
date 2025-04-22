namespace wfa_scolaireDepart
{
    partial class vueForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            rechercherGroupBox = new GroupBox();
            sessionComboBox = new ComboBox();
            label1 = new Label();
            nomCoursComboBox = new ComboBox();
            nomCoursRechercheLabel = new Label();
            dataGridView1 = new DataGridView();
            label2 = new Label();
            rechercherGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // rechercherGroupBox
            // 
            rechercherGroupBox.Controls.Add(sessionComboBox);
            rechercherGroupBox.Controls.Add(label1);
            rechercherGroupBox.Controls.Add(nomCoursComboBox);
            rechercherGroupBox.Controls.Add(nomCoursRechercheLabel);
            rechercherGroupBox.Location = new Point(14, 13);
            rechercherGroupBox.Margin = new Padding(5, 4, 5, 4);
            rechercherGroupBox.Name = "rechercherGroupBox";
            rechercherGroupBox.Padding = new Padding(5, 4, 5, 4);
            rechercherGroupBox.Size = new Size(667, 211);
            rechercherGroupBox.TabIndex = 17;
            rechercherGroupBox.TabStop = false;
            rechercherGroupBox.Text = "Rechercher un cours";
            // 
            // sessionComboBox
            // 
            sessionComboBox.Font = new Font("Segoe UI", 12F);
            sessionComboBox.FormattingEnabled = true;
            sessionComboBox.Location = new Point(263, 124);
            sessionComboBox.Margin = new Padding(5, 4, 5, 4);
            sessionComboBox.Name = "sessionComboBox";
            sessionComboBox.Size = new Size(369, 40);
            sessionComboBox.TabIndex = 8;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Yu Gothic", 12.75F);
            label1.ForeColor = Color.FromArgb(128, 64, 0);
            label1.Location = new Point(67, 129);
            label1.Margin = new Padding(5, 0, 5, 0);
            label1.Name = "label1";
            label1.Size = new Size(109, 34);
            label1.TabIndex = 7;
            label1.Text = "Session";
            // 
            // nomCoursComboBox
            // 
            nomCoursComboBox.Font = new Font("Segoe UI", 12F);
            nomCoursComboBox.FormattingEnabled = true;
            nomCoursComboBox.Location = new Point(263, 50);
            nomCoursComboBox.Margin = new Padding(5, 4, 5, 4);
            nomCoursComboBox.Name = "nomCoursComboBox";
            nomCoursComboBox.Size = new Size(369, 40);
            nomCoursComboBox.TabIndex = 6;
            nomCoursComboBox.SelectionChangeCommitted += nomCoursComboBox_SelectionChangeCommitted;
            // 
            // nomCoursRechercheLabel
            // 
            nomCoursRechercheLabel.AutoSize = true;
            nomCoursRechercheLabel.Font = new Font("Yu Gothic", 12.75F);
            nomCoursRechercheLabel.ForeColor = Color.FromArgb(128, 64, 0);
            nomCoursRechercheLabel.Location = new Point(67, 55);
            nomCoursRechercheLabel.Margin = new Padding(5, 0, 5, 0);
            nomCoursRechercheLabel.Name = "nomCoursRechercheLabel";
            nomCoursRechercheLabel.Size = new Size(180, 34);
            nomCoursRechercheLabel.TabIndex = 5;
            nomCoursRechercheLabel.Text = "Nom du cours";
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(14, 304);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 62;
            dataGridView1.Size = new Size(667, 310);
            dataGridView1.TabIndex = 18;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Yu Gothic", 12.75F);
            label2.ForeColor = Color.FromArgb(128, 64, 0);
            label2.Location = new Point(14, 257);
            label2.Margin = new Padding(5, 0, 5, 0);
            label2.Name = "label2";
            label2.Size = new Size(130, 34);
            label2.TabIndex = 19;
            label2.Text = "Étudiant :";
            // 
            // vueForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.MistyRose;
            ClientSize = new Size(695, 626);
            Controls.Add(label2);
            Controls.Add(dataGridView1);
            Controls.Add(rechercherGroupBox);
            Name = "vueForm";
            Text = "Modifier une note";
            Load += vueForm_Load;
            rechercherGroupBox.ResumeLayout(false);
            rechercherGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private GroupBox rechercherGroupBox;
        private ComboBox sessionComboBox;
        private Label label1;
        private ComboBox nomCoursComboBox;
        private Label nomCoursRechercheLabel;
        private DataGridView dataGridView1;
        private Label label2;
    }
}