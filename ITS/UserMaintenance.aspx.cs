﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ITS
{
    using BCrypt = BCrypt.Net.BCrypt;
    public partial class UserMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check the authority
            //System.Diagnostics.Debug.WriteLine((string)(Session["Authority"]));

            // out of authoriy not allowed to access
            if ((string)(Session["Authority"]) != "True")
            {
                Response.Redirect("Login.aspx");
            }

            // reload
            if (Request.QueryString["pm"] == "1")
            {
                lbMessage.Text = "New User was added!";
            }
            else if (Request.QueryString["pm"] == "2")
            {
                lbMessage.Text = "Update was successful!";
            }

            if (!IsPostBack)
            {
                if (rblAvailability.SelectedIndex == -1)
                {
                    rblAvailability.SelectedIndex = 0;
                    rblAuthority.SelectedIndex = 0;
                }
                else
                {
                    // button name 
                    btnExecute.Text = "Update";
                }
            }

            tbUserID.Attributes.Add("placeholder", "Input UserID eg.190001CH");
            tbFirstName.Attributes.Add("placeholder", "Input FistName");
            tbLastName.Attributes.Add("placeholder", "Input LastName");
            tbEmail.Attributes.Add("placeholder", "Input Email");
            tbPassword.Attributes.Add("placeholder", "Input Password");
            tbConfirm.Attributes.Add("placeholder", "Input Confirm Password");

            tbUserID.Attributes.Add("maxlength", "8");
            tbFirstName.Attributes.Add("maxlength", "100");
            tbLastName.Attributes.Add("maxlength", "100");
            tbEmail.Attributes.Add("maxlength", "100");
            tbPassword.Attributes.Add("maxlength", "8");
            tbConfirm.Attributes.Add("maxlength", "8");

            tbPassword.Attributes["type"] = "password";
            tbConfirm.Attributes["type"] = "password";

        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            bool isAdd = true;
            if (hfFlg.Value.Trim() == "true")
            {
                isAdd = false;
            }

            lbMessage.Text = "";
            using (SqlConnection con = new SqlConnection(Globals.connstr))
            {
                con.Open();
                // Check ID
                if (isAdd)
                {
                    SqlCommand cmd1 = new SqlCommand(
                        "SELECT * " +
                        "FROM users " +
                        "WHERE id = @id"
                        , con);

                    SqlCommand cmd2 = new SqlCommand(
                        "SELECT * " +
                        "FROM users " +
                        "WHERE e_mail = @email"
                        , con);

                    cmd1.Parameters.AddWithValue("@id", tbUserID.Text.Trim());
                    cmd2.Parameters.AddWithValue("@email", tbEmail.Text.Trim());

                    try
                    {
                        using (SqlDataReader rdr = cmd1.ExecuteReader())
                        {
                            if (rdr.HasRows)
                            {
                                // Existing
                                lbMessage.Text = "This UserID is already existing.";
                            }
                        }
                        using (SqlDataReader rdr = cmd2.ExecuteReader())
                        {
                            if (rdr.HasRows)
                            {
                                // Existing
                                lbMessage.Text = lbMessage.Text.Length > 0 ? lbMessage.Text + "\nThis Email is already registered." : "This Email is already registered.";
                            }
                        }

                        if (lbMessage.Text.Length > 0)
                        {
                            return;
                        }

                        SqlCommand cmd = new SqlCommand("" +
                            "Insert into users(" +
                            "id, first_name, last_name, e_mail, authorization_level_id, availability, password, " +
                            "created_user, created_date, updated_user, updated_date) " +
                            "values(@userId, @firstName, @lastName,@email,@authLevel,@availability,@password," +
                            "@activeUser,CURRENT_TIMESTAMP,@activeUser,CURRENT_TIMESTAMP)", con);

                        cmd.Parameters.AddWithValue("@userId", tbUserID.Text);
                        cmd.Parameters.AddWithValue("@firstName", tbFirstName.Text);
                        cmd.Parameters.AddWithValue("@lastName", tbLastName.Text);
                        cmd.Parameters.AddWithValue("@email", tbEmail.Text);

                        string passwordHash = BCrypt.HashPassword(tbPassword.Text.Trim(), BCrypt.GenerateSalt());
                        cmd.Parameters.AddWithValue("@password", passwordHash);
                        cmd.Parameters.AddWithValue("@availability", rblAvailability.SelectedIndex.ToString());
                        cmd.Parameters.AddWithValue("@authLevel", rblAuthority.SelectedIndex.ToString());
                        cmd.Parameters.AddWithValue("@activeUser", "admin");


                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            if (isAdd)
                            {
                                Response.Redirect(Request.QueryString["pm"] == null ?
                                Request.Url.OriginalString + "?pm=1" :
                                Request.Url.OriginalString.Substring(0, Request.Url.OriginalString.IndexOf("?")) + "?pm=1");
                            }
                            else
                            {
                                Response.Redirect(Request.QueryString["pm"] == null ?
                                Request.Url.OriginalString + "?pm=2" :
                                Request.Url.OriginalString.Substring(0, Request.Url.OriginalString.IndexOf("?")) + "?pm=2");
                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        // System Error
                        Console.WriteLine(ex.Message);
                        // Move to an Error page
                        Response.Redirect("SystemError.aspx");
                    }
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand(
                        "SELECT * " +
                        "FROM users " +
                        "WHERE e_mail = @email and id <> @id"
                        , con);

                    cmd1.Parameters.AddWithValue("@id", tbUserID.Text.Trim());
                    cmd1.Parameters.AddWithValue("@email", tbEmail.Text.Trim());
                    try
                    {
                        using (SqlDataReader rdr = cmd1.ExecuteReader())
                        {
                            if (rdr.HasRows)
                            {
                                // Existing
                                lbMessage.Text = "This Email is already registered.";
                                System.Diagnostics.Debug.WriteLine("here7");
                                return;
                            }
                        }
                        
                        SqlCommand cmd = new SqlCommand("" +
                            "UPDATE users " +
                            "SET first_name = @firstName, last_name = @lastName, " +
                            "e_mail = @email, authorization_level_id = @authLevel, availability = @availability, " +
                            "updated_user = @activeUser, updated_date = CURRENT_TIMESTAMP " +
                            "WHERE id = @userId ", con);

                        cmd.Parameters.AddWithValue("@userId", tbUserID.Text);
                        cmd.Parameters.AddWithValue("@firstName", tbFirstName.Text);
                        cmd.Parameters.AddWithValue("@lastName", tbLastName.Text);
                        cmd.Parameters.AddWithValue("@email", tbEmail.Text);

                        cmd.Parameters.AddWithValue("@availability", rblAvailability.SelectedIndex.ToString());
                        cmd.Parameters.AddWithValue("@authLevel", rblAuthority.SelectedIndex.ToString());

                        cmd.Parameters.AddWithValue("@activeUser", "admin");
                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            Response.Redirect(Request.QueryString["pm"] == null ?
                                Request.Url.OriginalString + "?pm=2" :
                                Request.Url.OriginalString.Substring(0, Request.Url.OriginalString.IndexOf("?")) + "?pm=2");
                        }
                    }
                    catch (Exception ex)
                    {
                        // System Error
                        Console.WriteLine(ex.Message);
                        // Move to an Error page
                        Response.Redirect("SystemError.aspx");
                    }
                }

            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnChangePW_Click(object sender, EventArgs e)
        {
            Session["TargetUserID"] = hfTargetId.Value.Trim();
            Response.Redirect("ChangePasswordSP.aspx");
        }
    }
}