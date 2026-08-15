import mongoose from "mongoose";

const AddressSchema = new mongoose.Schema({
  street: String,
  city: String,
  state: String,
  postcode: String,
});

const PreferencesSchema = new mongoose.Schema({
  newsletter: { type: Boolean, default: false },
  theme: { type: String, enum: ["light", "dark"], default: "light" },
});

// The User schema demonstrates how to handle semi-structured data
// with embedded documents (Address, Preferences)
const UserSchema = new mongoose.Schema({
  firstName: {
    type: String,
    required: [true, "Please provide a first name."],
  },
  lastName: {
    type: String,
    required: [true, "Please provide a last name."],
  },
  email: {
    type: String,
    required: [true, "Please provide an email address."],
    unique: true,
  },
  role: {
    type: String,
    enum: ["admin", "user"],
    default: "user",
  },
  address: AddressSchema,
  preferences: PreferencesSchema,
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

export default mongoose.models.User || mongoose.model("User", UserSchema);
